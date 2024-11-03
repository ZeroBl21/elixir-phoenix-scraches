defmodule Pento.Promo do
  alias Pento.Promo.Recipient

  def change_recipient(%Recipient{} = recipient, attrs \\ %{}) do
    Recipient.changeset(recipient, attrs)
  end

  def send_promo(_recipient, _attrs) do
    # Programmer 1: Insert logic to email to promo recipient
    # Programmer 2: No.
    {:ok, %Recipient{}}
  end
end
