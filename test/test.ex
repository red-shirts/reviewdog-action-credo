defmodule Foo do
  def foo do
    bar(:atom)
    |> baz()
  end
end
