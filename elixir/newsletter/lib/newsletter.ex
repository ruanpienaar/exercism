defmodule Newsletter do
  def read_emails(path) do
    case File.read(path) do
      {:ok, data} ->
        data
        |> String.split("\n", trim: true)

      {:error, _} ->
        []
    end
  end

  def open_log(path), do: File.open!(path, [:write])

  def log_sent_email(pid, email), do: IO.puts(pid, email)

  def close_log(pid), do: File.close(pid)

  def send_newsletter(emails_path, log_path, send_fun) do
    recipients = read_emails(emails_path)
    log_pid = open_log(log_path)

    recipients
    |> Enum.each(fn recipient ->
      if send_fun.(recipient) == :ok do
        :ok = log_sent_email(log_pid, recipient)
      end
    end)

    close_log(log_pid)
  end
end
