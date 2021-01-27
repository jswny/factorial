defmodule Factorial.Log do
  def get_watcher_args do
    [
      dirs: [get_log_file_path()]
    ]
  end

  defp get_log_file_path do
    __MODULE__
    |> Application.get_application()
    |> Application.get_env(:log_file_path)
  end
end
