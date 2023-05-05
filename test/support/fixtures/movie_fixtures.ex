defmodule Movies.MovieFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Movies.Movie` context.
  """

  @doc """
  Generate a movies_request.
  """
  def movies_request_fixture(attrs \\ %{}) do
    {:ok, movies_request} =
      attrs
      |> Enum.into(%{
        authors: ["option1", "option2"],
        category: "some category",
        date_opening: ~U[2023-05-04 19:08:00Z],
        description: "some description",
        director: "some director",
        duration: 42,
        image: "some image",
        language: "some language",
        name: "some name",
        poster: "some poster",
        year: ~U[2023-05-04 19:08:00Z]
      })
      |> Movies.Movie.create_movies_request()

    movies_request
  end
end
