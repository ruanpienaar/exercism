defmodule LogLevel do

  def to_label(level, legacy?) do
    cond do 
      legacy? and (level < 1 or level > 4) -> :unknown
      level == 0 -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
      label = to_label(level, legacy?)
      cond do 
        label == :unknown and legacy? -> :dev1
        label == :unknown -> :dev2
        label == :error or label == :fatal -> :ops
        true -> false
      end
  end
end

