defmodule DateInputWeb.DateInputLive do
  use DateInputWeb, :live_view

  def mount(_params, session, socket) do
    socket = default_assigns(socket)
    {:ok, socket}
  end

  defp default_assigns(socket) do
    socket
    |> assign(:from_date, "2021-12-02T17:00:00Z")
    |> assign(:to_date, "2021-12-05T17:00:00Z")
    |> assign(:subject, "")
  end

  def handle_params(
        %{"from-date" => from_date, "to-date" => to_date, "subject" => subject},
        _uri,
        socket
      ) do
    socket =
      socket
      |> assign(:from_date, unix_to_iso(from_date))
      |> assign(:to_date, unix_to_iso(to_date))
      |> assign(:subject, subject)

    {:noreply, socket}
  end

  def handle_params(_params, _uri, socket) do
    socket = default_assigns(socket)

    {:noreply, socket}
  end

  defp unix_to_iso(unix_time) do
    case unix_time do
      "" ->
        ""

      unix_time ->
        {:ok, datetime} =
          unix_time
          |> String.to_integer()
          |> DateTime.from_unix()

        DateTime.to_iso8601(datetime)
    end
  end

  def handle_event("filter", params, socket) do
    params =
      params
      |> Map.update("from-date", "", &date_filter_to_unix/1)
      |> Map.update("to-date", "", &date_filter_to_unix/1)
      |> Map.delete("_target")

    route = Routes.live_path(socket, __MODULE__, params)

    {:noreply, push_patch(socket, to: route)}
  end

  defp date_filter_to_unix(""), do: ""

  defp date_filter_to_unix(iso_date) do
    {:ok, dt, _} = DateTime.from_iso8601(iso_date)

    DateTime.to_unix(dt)
  end

  def handle_event("reset", _params, socket) do
    route = Routes.live_path(socket, __MODULE__)

    {:noreply, push_patch(socket, to: route)}
  end
end
