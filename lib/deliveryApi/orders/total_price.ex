defmodule DeliveryApi.Orders.TotalPrice do
  alias DeliveryApi.Item

  def calculate(items) do
    Enum.reduce(items, Decimal.new("0.00"), &sum_prices/2)
  end

  defp sum_prices(%Item{price: price}, acc), do: Decimal.add(price, acc)
end
