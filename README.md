# utils_http
Utilities to work with HTTP in Elixir

Currently it's work in progress for internal usage, missing tests, use at your own risk.

You could implement your own http client for `@behaviour HttpClient`
or use default `UtilsHttp.Client.HTTPoison` implementation


## Example of usage with default HTTPoison implementation
```elixir
defmodule ExampleLib.HttpClient do
  @moduledoc """
  Utility wrapper for making HTTP requests.

  Delegates to the configured HTTP client module.
  """
  use UtilsHttp.Behaviour.HttpClient, http_client: UtilsHttp.Client.HTTPoison
end
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `utils_http` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:utils_http, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/utils_http](https://hexdocs.pm/utils_http).
