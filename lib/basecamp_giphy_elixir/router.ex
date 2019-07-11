defmodule BasecampGiphyElixir.Router do
  use Plug.Router
  @nil_result "https://media2.giphy.com/media/OKEYg2ISpaedy/200.gif?cid=b655aded5d26458039357235735133a6&rid=200.gif"

  plug(:match)
  plug(:dispatch)

  get "/:query" do 
    conn
    |> put_resp_content_type("text/html")
    |> get_gif(query)
  end

  post "/" do
    conn
    |> put_resp_content_type("text/html")
    |> get_gif(conn.body_params["command"])
  end

  match _ do
    send_resp conn, 404, "Requested page not found!\n"
  end

  def get_gif(conn, q) do
    case Giphy.search(q, limit: 1, rating: "g") do
      {:ok, page} -> send_resp(conn, 200, get_resp(page))
      {:error, result} -> send_resp(conn, 500, result)
    end
  end

  def get_resp(page) do
    Enum.at(page.data, 0)
    |> get_url
    |> get_html
  end

  def get_url(nil) do
    @nil_result
  end

  def get_url(gif) do
    gif.images["fixed_height"]["url"]
  end

  def get_html(url) do
    "<img src='#{url}'>"
  end
end