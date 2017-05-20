fizz_buzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_,_, val) -> val
 end

fizz_buzz_impl = fn n -> fizz_buzz.(rem(n, 3), rem(n, 5), n) end

IO.puts fizz_buzz_impl.(10)
IO.puts fizz_buzz_impl.(11)
IO.puts fizz_buzz_impl.(12)
IO.puts fizz_buzz_impl.(13)
IO.puts fizz_buzz_impl.(14)
IO.puts fizz_buzz_impl.(15)
IO.puts fizz_buzz_impl.(16)
IO.puts fizz_buzz_impl.(17)
