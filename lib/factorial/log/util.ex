defmodule Factorial.Log.Util do
  @moduledoc false

  def read_file_position(path, start) do
    {:ok, file} = :file.open(path, [:binary])

    length = get_file_length(path)

    {:ok, data} = :file.pread(file, start, length)

    :file.close(file)
    {data, length}
  end

  def get_file_length(path) do
    info = File.stat!(path)
    info.size
  end
end
