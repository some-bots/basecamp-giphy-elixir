defmodule BasecampGiphyElixir.Endpoint do
  use Plug.Router
  require Logger

  plug :match

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug :dispatch

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(_opts) do
    with {:ok, [port: port] = config} <- Application.fetch_env(:basecamp_giphy_elixir, __MODULE__) do
      Logger.info("Starting server at http://localhost:#{port}/")
      Plug.Cowboy.http(__MODULE__, [], config)
    end
  end
  
  forward("/cmd", to: BasecampGiphyElixir.Router)
  
  get "/" do
    send_resp(conn, 200, "Hi from Basecamp-giphy-elixir bot! 🤖")
  end

  match _ do
    send_resp(conn, 404, "Requested page not found!")
  end
end  
