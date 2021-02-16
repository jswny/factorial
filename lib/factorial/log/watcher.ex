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
    {:ok, %{watcher_pid: watcher_pid}}
  end

  def handle_info(
        {:file_event, watcher_pid, {path, events}},
        %{watcher_pid: watcher_pid} = state
      ) do
    if Enum.member?(events, :modified) do
      Logger.debug("Monitored file at path \"#{path}\" was modified")
      handle_file_modified(path)
    end

    {:noreply, state}
  end

  def handle_info({:file_event, watcher_pid, :stop}, %{watcher_pid: watcher_pid} = state) do
    Logger.warning("Log watching stopped!")
    {:noreply, state}
  end

  defp handle_file_modified(_path) do
  end
end
