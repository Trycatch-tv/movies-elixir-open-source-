defmodule Movies.Movie do
  @moduledoc """
  The Movie context.
  """

  import Ecto.Query, warn: false
  alias Movies.Repo

  alias Movies.Movie.Movies_request

  @doc """
  Returns the list of movies.

  ## Examples

      iex> list_movies()
      [%Movies_request{}, ...]

  """
  def list_movies do
    Repo.all(Movies_request)
  end

  @doc """
  Gets a single movies_request.

  Raises `Ecto.NoResultsError` if the Movies request does not exist.

  ## Examples

      iex> get_movies_request!(123)
      %Movies_request{}

      iex> get_movies_request!(456)
      ** (Ecto.NoResultsError)

  """
  def get_movies_request!(id), do: Repo.get!(Movies_request, id)

  @doc """
  Creates a movies_request.

  ## Examples

      iex> create_movies_request(%{field: value})
      {:ok, %Movies_request{}}

      iex> create_movies_request(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_movies_request(attrs \\ %{}) do
    %Movies_request{}
    |> Movies_request.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a movies_request.

  ## Examples

      iex> update_movies_request(movies_request, %{field: new_value})
      {:ok, %Movies_request{}}

      iex> update_movies_request(movies_request, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_movies_request(%Movies_request{} = movies_request, attrs) do
    movies_request
    |> Movies_request.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a movies_request.

  ## Examples

      iex> delete_movies_request(movies_request)
      {:ok, %Movies_request{}}

      iex> delete_movies_request(movies_request)
      {:error, %Ecto.Changeset{}}

  """
  def delete_movies_request(%Movies_request{} = movies_request) do
    Repo.delete(movies_request)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking movies_request changes.

  ## Examples

      iex> change_movies_request(movies_request)
      %Ecto.Changeset{data: %Movies_request{}}

  """
  def change_movies_request(%Movies_request{} = movies_request, attrs \\ %{}) do
    Movies_request.changeset(movies_request, attrs)
  end
end
