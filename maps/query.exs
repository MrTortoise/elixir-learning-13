people = [
  %{name: "Grumpy1", height: 1.24},
  %{name: "Grumpy2", height: 1.25},
  %{name: "Grumpy3", height: 1.26},
  %{name: "Grumpy4", height: 1.27},
]

IO.inspect(for person = %{ height: height} <- people, height > 1.25, do: person )
