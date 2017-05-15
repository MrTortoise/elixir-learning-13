defmodule Span do
  def span(to, to), do: [to]
  def span(from, to) do
    [from | span(from+1,to)]
  end

  def primeNumbers(n) do
    for x <- span(2, n), isPrime(x), do: x
  end

  def isPrime(2), do: true
  def isPrime(3), do: true
  def isPrime(n) do
    Enum.reduce(span(2,n-1), true, fn val, isPrime ->  isPrime && rem(n,val) != 0 end )
  end


  def calculateTax(rates, orders) do
    for row <- orders, rate <- rates, do: applyTax(row, rate)
  end

  def applyTax([id: id, ship_to: state, net_amount: amount], {state, rate}), do: [id, state, amount, total_amount: amount * rate]
  def applyTax([id: id, ship_to: state, net_amount: amount], _rate), do: [id, state, amount, total_amount: amount]

end

tax_rates = [NC: 0.075, TX: 0.08]

orders = [
  [id: 123, ship_to: :NC, net_amount: 100.00],
  [id: 124, ship_to: :OK, net_amount: 35.50],
  [id: 125, ship_to: :TX, net_amount: 24.00],
  [id: 126, ship_to: :TX, net_amount: 44.80],
  [id: 127, ship_to: :NC, net_amount: 25.00],
  [id: 128, ship_to: :MA, net_amount: 10.00],
  [id: 129, ship_to: :CA, net_amount: 102.00],
  [id: 130, ship_to: :NC, net_amount: 50.00],
]

Span.calculateTax(tax_rates, orders)
