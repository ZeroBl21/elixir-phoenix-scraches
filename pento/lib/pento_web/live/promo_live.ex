defmodule PentoWeb.PromoLive do
  use PentoWeb, :live_view
  alias Pento.Promo
  alias Pento.Promo.Recipient

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign_recipent()
     |> assign_form()}
  end

  def assign_recipent(socket) do
    socket
    |> assign(:recipient, %Recipient{})
  end

  def assign_form(%{assigns: %{recipient: recipient}} = socket) do
    form = Promo.change_recipent(recipient) |> to_form()

    socket
    |> assign(:form, form)
  end
end
