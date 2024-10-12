defmodule PentoWeb.WrongLive do
  use Phoenix.LiveView, layout: {PentoWeb.Layouts, :app}

  @impl true
  def mount(_params, _session, socket) do
    {
      :ok,
      assign(socket,
        id: :rand.uniform(100),
        score: 0,
        message: "Make a guess:",
        time: time()
      )
    }
  end

  @impl true
  def render(assigns) do
    ~H"""
    <h1>Game #<%= @id %></h1>
    <h2>
      <span>Your score: <%= @score %></span>
      <p>
        The time it's <time><%= @time %></time>
      </p>
      <br />
      <%= @message %>
    </h2>
    <h2>
      <%= for n <- 1..10 do %>
        <a href="#" phx-click="guess" phx-value-number={n}><%= n %></a>
      <% end %>
    </h2>
    """
  end

  def time() do
    DateTime.utc_now() |> to_string
  end

  @impl true
  def handle_event("guess", %{"number" => guess}, socket) do
    number = :rand.uniform(10)
    guess = String.to_integer(guess)

    {message, score_change} =
      if guess == number do
        {"You Win! The number was #{number}", 1}
      else
        {"Your guess: #{guess}. Wrong. Guess Again. The number was #{number}", -1}
      end

    {
      :noreply,
      assign(
        socket,
        message: message,
        score: socket.assigns.score + score_change,
        time: time()
      )
    }
  end
end
