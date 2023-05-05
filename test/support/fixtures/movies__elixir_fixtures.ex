defmodule Movies.Movies_ElixirFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Movies.Movies_Elixir` context.
  """

  @doc """
  Generate a movie.
  """
  def movie_fixture(attrs \\ %{}) do
    {:ok, movie} =
      attrs
      |> Enum.into(%{
        authors: ["option1", "option2"],
        category: "some category",
        date_opening: ~U[2023-05-04 18:32:00Z],
        description: "some description",
        director: "some director",
        duration: 42,
        image: "some image",
        language: "some language",
        name: "some name",
        poster: "some poster",
        year: ~U[2023-05-04 18:32:00Z]
      })
      |> Movies.Movies_Elixir.create_movie()

    movie
  end
end
