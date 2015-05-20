defmodule HelloBlog.BlogChannel do
  use HelloBlog.Web, :channel

  def join("blogs:lobby", payload, socket) do
    IO.puts "joined!"
    IO.puts(payload |> inspect)
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # This is invoked every time a notification is being broadcast
  # to the client. The default implementation is just to push it
  # downstream but one could filter or change the event.
  def handle_out(event, payload, socket) do
    push socket, event, payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
