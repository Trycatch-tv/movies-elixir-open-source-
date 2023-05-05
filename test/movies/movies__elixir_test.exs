defmodule Movies.Movies_ElixirTest do
  use Movies.DataCase

  alias Movies.Movies_Elixir

  describe "movies" do
    alias Movies.Movies_Elixir.Movie

    import Movies.Movies_ElixirFixtures

    @invalid_attrs %{authors: nil, category: nil, date_opening: nil, description: nil, director: nil, duration: nil, image: nil, language: nil, name: nil, poster: nil, year: nil}

    test "list_movies/0 returns all movies" do
      movie = movie_fixture()
      assert Movies_Elixir.list_movies() == [movie]
    end

    test "get_movie!/1 returns the movie with given id" do
      movie = movie_fixture()
      assert Movies_Elixir.get_movie!(movie.id) == movie
    end

    test "create_movie/1 with valid data creates a movie" do
      valid_attrs = %{authors: ["option1", "option2"], category: "some category", date_opening: ~U[2023-05-04 18:32:00Z], description: "some description", director: "some director", duration: 42, image: "some image", language: "some language", name: "some name", poster: "some poster", year: ~U[2023-05-04 18:32:00Z]}

      assert {:ok, %Movie{} = movie} = Movies_Elixir.create_movie(valid_attrs)
      assert movie.authors == ["option1", "option2"]
      assert movie.category == "some category"
      assert movie.date_opening == ~U[2023-05-04 18:32:00Z]
      assert movie.description == "some description"
      assert movie.director == "some director"
      assert movie.duration == 42
      assert movie.image == "some image"
      assert movie.language == "some language"
      assert movie.name == "some name"
      assert movie.poster == "some poster"
      assert movie.year == ~U[2023-05-04 18:32:00Z]
    end

    test "create_movie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Movies_Elixir.create_movie(@invalid_attrs)
    end

    test "update_movie/2 with valid data updates the movie" do
      movie = movie_fixture()
      update_attrs = %{authors: ["option1"], category: "some updated category", date_opening: ~U[2023-05-05 18:32:00Z], description: "some updated description", director: "some updated director", duration: 43, image: "some updated image", language: "some updated language", name: "some updated name", poster: "some updated poster", year: ~U[2023-05-05 18:32:00Z]}

      assert {:ok, %Movie{} = movie} = Movies_Elixir.update_movie(movie, update_attrs)
      assert movie.authors == ["option1"]
      assert movie.category == "some updated category"
      assert movie.date_opening == ~U[2023-05-05 18:32:00Z]
      assert movie.description == "some updated description"
      assert movie.director == "some updated director"
      assert movie.duration == 43
      assert movie.image == "some updated image"
      assert movie.language == "some updated language"
      assert movie.name == "some updated name"
      assert movie.poster == "some updated poster"
      assert movie.year == ~U[2023-05-05 18:32:00Z]
    end

    test "update_movie/2 with invalid data returns error changeset" do
      movie = movie_fixture()
      assert {:error, %Ecto.Changeset{}} = Movies_Elixir.update_movie(movie, @invalid_attrs)
      assert movie == Movies_Elixir.get_movie!(movie.id)
    end

    test "delete_movie/1 deletes the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{}} = Movies_Elixir.delete_movie(movie)
      assert_raise Ecto.NoResultsError, fn -> Movies_Elixir.get_movie!(movie.id) end
    end

    test "change_movie/1 returns a movie changeset" do
      movie = movie_fixture()
      assert %Ecto.Changeset{} = Movies_Elixir.change_movie(movie)
    end
  end
end
