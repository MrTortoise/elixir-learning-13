data = %{ name: "dave", state: "TX", likes: "elixir"}

for key <- [:name, :likes] do
  %{ ^key => value } = data
  value
end
