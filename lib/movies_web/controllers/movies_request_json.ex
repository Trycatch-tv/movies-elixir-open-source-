defmodule MoviesWeb.Movies_requestJSON do
  alias Movies.Movie.Movies_request

  @doc """
  Renders a list of movies.
  """
  def index(%{movies: movies}) do
    %{data: for(movies_request <- movies, do: data(movies_request))}
  end

  @doc """
  Renders a single movies_request.
  """
  def show(%{movies_request: movies_request}) do
    %{data: data(movies_request)}
  end

  defp data(%Movies_request{} = movies_request) do
    %{
      id: movies_request.id,
      name: movies_request.name,
      category: movies_request.category,
      date_opening: movies_request.date_opening,
      description: movies_request.description,
      authors: movies_request.authors,
      director: movies_request.director,
      year: movies_request.year,
      duration: movies_request.duration,
      image: movies_request.image,
      language: movies_request.language,
      poster: movies_request.poster
    }
  end
end
