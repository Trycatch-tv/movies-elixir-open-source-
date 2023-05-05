defmodule MoviesWeb.Movies_requestController do
  use MoviesWeb, :controller

  alias Movies.Movie
  alias Movies.Movie.Movies_request

  action_fallback MoviesWeb.FallbackController

  def index(conn, _params) do
    movies = Movie.list_movies()
    render(conn, :index, movies: movies)
  end

  def create(conn, %{"movies_request" => movies_request_params}) do
    with {:ok, %Movies_request{} = movies_request} <- Movie.create_movies_request(movies_request_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/movies/#{movies_request}")
      |> render(:show, movies_request: movies_request)
    end
  end

  def show(conn, %{"id" => id}) do
    movies_request = Movie.get_movies_request!(id)
    render(conn, :show, movies_request: movies_request)
  end

  def update(conn, %{"id" => id, "movies_request" => movies_request_params}) do
    movies_request = Movie.get_movies_request!(id)

    with {:ok, %Movies_request{} = movies_request} <- Movie.update_movies_request(movies_request, movies_request_params) do
      render(conn, :show, movies_request: movies_request)
    end
  end

  def delete(conn, %{"id" => id}) do
    movies_request = Movie.get_movies_request!(id)

    with {:ok, %Movies_request{}} <- Movie.delete_movies_request(movies_request) do
      send_resp(conn, :no_content, "")
    end
  end
end
