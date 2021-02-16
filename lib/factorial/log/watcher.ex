defmodule Factorial.Log.Watcher do
  @moduledoc false

  require Logger
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  def init(args) do
    {:ok, watcher_pid} = FileSystem.start_link(args)
    FileSystem.subscribe(watcher_pid)
    {:ok, %{watcher_pid: watcher_pid, positions: %{}}}
  end

  def handle_info(
        {:file_event, watcher_pid, {path, events}},
        %{watcher_pid: watcher_pid, positions: positions} = state
      ) do
    if Enum.member?(events, :modified) do
      Logger.debug("Monitored file at path \"#{path}\" was modified")

      old_position = get_position_for_path(positions, path)

      new_position = handle_file_modified(path, old_position)

      new_positions = put_position_for_path(positions, path, new_position)
      new_state = %{state | positions: new_positions}

      {:noreply, new_state}
    else
      {:noreply, state}
    end
  end

  def handle_info(
        {:file_event, watcher_pid, :stop},
        %{watcher_pid: watcher_pid, positions: _positions} = state
      ) do
    Logger.warning("Log watching stopped!")
    {:noreply, state}
  end

  defp handle_file_modified(path, old_position) do
    {new_data, new_position} = read_position(path, old_position)
    Logger.debug("Got new file data:\n#{new_data}")
    new_position
  end

  defp get_position_for_path(positions, path) do
    Map.get(positions, path, 0)
  end

  defp put_position_for_path(positions, path, position) do
    Map.put(positions, path, position)
  end

  defp read_position(path, start) do
    {:ok, file} = :file.open(path, [:binary])

    length = get_file_length(path)

    {:ok, data} = :file.pread(file, start, length)

    :file.close(file)
    {data, length}
  end

  defp get_file_length(path) do
    info = File.stat!(path)
    info.size
  end
end
