defmodule Pento.Promo do
  alias Pento.Promo.Recipient

  def change_recipent(%Recipient{} = recipent, attrs \\ %{}) do
    Recipient.changeset(recipent, attrs)
  end

  def send_promo(_recipent, _attrs) do
    # Programmer 1: Insert logic to email to promo recipent
    # Programmer 2: No.
    {:ok, %Recipient{}}
  end
end
