defmodule UtilsHttp.Behaviour.HttpClient do
  @moduledoc """
  Behaviour for making HTTP requests, to be implemented by adapters.
  """

  @type payload :: map() | binary()
  @type response :: {:ok, nil | map() | String.t() | [map()]} | {:error, HttpError.t()}
  @type http_header :: Http.Client.HTTPoison.http_header()

  defmodule HttpError do
    defexception message: "HTTP request failed", code: nil, data: nil

    def new(message, code \\ nil, data \\ nil) do
      %__MODULE__{
        message: message,
        code: code,
        data: data
      }
    end
  end

  @doc """
  HTTP GET request, all payload is URL encoded.
  """
  @callback get(String.t(), [http_header], Keyword.t()) :: response

  @doc """
  HTTP PUT request.
  """
  @callback put(String.t(), payload, [http_header], Keyword.t()) :: response

  @doc """
  HTTP POST request.
  """
  @callback post(String.t(), payload, [http_header], Keyword.t()) :: response

  @doc """
  HTTP DELETE request.
  """
  @callback delete(String.t(), [http_header], Keyword.t()) :: response

  @spec __using__([{:http_client, module()}, ...]) ::
          {:__block__, [], [{:defdelegate, [...], [...]}, ...]}
  defmacro __using__(http_client: http_client) do
    quote do
      defdelegate get(url), to: unquote(http_client)
      defdelegate get(url, headers), to: unquote(http_client)
      defdelegate get(url, headers, opts), to: unquote(http_client)

      defdelegate put(url, payload), to: unquote(http_client)
      defdelegate put(url, payload, headers), to: unquote(http_client)
      defdelegate put(url, payload, headers, opts), to: unquote(http_client)

      defdelegate post(url, payload), to: unquote(http_client)
      defdelegate post(url, payload, headers), to: unquote(http_client)
      defdelegate post(url, payload, headers, opts), to: unquote(http_client)

      defdelegate delete(url), to: unquote(http_client)
      defdelegate delete(url, headers), to: unquote(http_client)
      defdelegate delete(url, headers, opts), to: unquote(http_client)
    end
  end
end
