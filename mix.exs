defmodule ReviewdogCredo.Mixfile do
  use Mix.Project

  def project do
    [
      app: :reviewdog_credo,
      deps: deps()
    ]
  end

  defp deps do
    [
      {:credo, ">= 0.0.0"}
    ]
  end
end
