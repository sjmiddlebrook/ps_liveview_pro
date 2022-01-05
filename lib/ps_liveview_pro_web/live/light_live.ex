defmodule PsLiveviewProWeb.LightLive do
  use PsLiveviewProWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :brightness, 10)
    {:ok, socket}
  end

  def handle_event("on", _, socket) do
    socket = assign(socket, :brightness, 100)
    {:noreply, socket}
  end

  def handle_event("up", _, socket) do
    socket = update(socket, :brightness, &min(&1 + 10, 100))
    {:noreply, socket}
  end

  def handle_event("down", _, socket) do
    socket = update(socket, :brightness, &max(&1 - 10, 0))
    {:noreply, socket}
  end

  def handle_event("off", _, socket) do
    socket = assign(socket, :brightness, 0)
    {:noreply, socket}
  end

  def handle_event("random", _, socket) do
    random_number = :rand.uniform(100)
    socket = assign(socket, :brightness, random_number)
    {:noreply, socket}
  end
end
