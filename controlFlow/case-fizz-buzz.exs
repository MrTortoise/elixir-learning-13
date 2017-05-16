defmodule Case do
  def fizzBuzz(number) do
    fizz = rem(number,3)
    buzz = rem(number,5)

    case fizz do
      0 ->
        case buzz do
          0 -> "FizzBuzz"
          _ -> "Fizz"
        end
      _ ->
        case buzz do
          0 -> "Buzz"
          _ -> number
      end
    end
  end

end
