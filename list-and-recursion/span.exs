defmodule Span do
  def span(to, to), do: [to]
  def span(from, to) do
    [from | span(from+1,to)]
  end

  def primeNumbers(n) do
    for x <- span(2, n), isPrime(n), do: x
  end

  def isPrime(2), do: true
  def isPrime(3), do: true
  def isPrime(n) do
    Enum.reduce(span(2,n-1), true, fn val, isPrime ->  isPrime && rem(n,val) != 0 end )
  end

end
