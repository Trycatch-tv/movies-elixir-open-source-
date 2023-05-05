defmodule Movies.MovieTest do
  use Movies.DataCase

  alias Movies.Movie

  describe "movies" do
    alias Movies.Movie.Movies_request

    import Movies.MovieFixtures

    @invalid_attrs %{authors: nil, category: nil, date_opening: nil, description: nil, director: nil, duration: nil, image: nil, language: nil, name: nil, poster: nil, year: nil}

    test "list_movies/0 returns all movies" do
      movies_request = movies_request_fixture()
      assert Movie.list_movies() == [movies_request]
    end

    test "get_movies_request!/1 returns the movies_request with given id" do
      movies_request = movies_request_fixture()
      assert Movie.get_movies_request!(movies_request.id) == movies_request
    end

    test "create_movies_request/1 with valid data creates a movies_request" do
      valid_attrs = %{authors: ["option1", "option2"], category: "some category", date_opening: ~U[2023-05-04 19:08:00Z], description: "some description", director: "some director", duration: 42, image: "some image", language: "some language", name: "some name", poster: "some poster", year: ~U[2023-05-04 19:08:00Z]}

      assert {:ok, %Movies_request{} = movies_request} = Movie.create_movies_request(valid_attrs)
      assert movies_request.authors == ["option1", "option2"]
      assert movies_request.category == "some category"
      assert movies_request.date_opening == ~U[2023-05-04 19:08:00Z]
      assert movies_request.description == "some description"
      assert movies_request.director == "some director"
      assert movies_request.duration == 42
      assert movies_request.image == "some image"
      assert movies_request.language == "some language"
      assert movies_request.name == "some name"
      assert movies_request.poster == "some poster"
      assert movies_request.year == ~U[2023-05-04 19:08:00Z]
    end

    test "create_movies_request/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Movie.create_movies_request(@invalid_attrs)
    end

    test "update_movies_request/2 with valid data updates the movies_request" do
      movies_request = movies_request_fixture()
      update_attrs = %{authors: ["option1"], category: "some updated category", date_opening: ~U[2023-05-05 19:08:00Z], description: "some updated description", director: "some updated director", duration: 43, image: "some updated image", language: "some updated language", name: "some updated name", poster: "some updated poster", year: ~U[2023-05-05 19:08:00Z]}

      assert {:ok, %Movies_request{} = movies_request} = Movie.update_movies_request(movies_request, update_attrs)
      assert movies_request.authors == ["option1"]
      assert movies_request.category == "some updated category"
      assert movies_request.date_opening == ~U[2023-05-05 19:08:00Z]
      assert movies_request.description == "some updated description"
      assert movies_request.director == "some updated director"
      assert movies_request.duration == 43
      assert movies_request.image == "some updated image"
      assert movies_request.language == "some updated language"
      assert movies_request.name == "some updated name"
      assert movies_request.poster == "some updated poster"
      assert movies_request.year == ~U[2023-05-05 19:08:00Z]
    end

    test "update_movies_request/2 with invalid data returns error changeset" do
      movies_request = movies_request_fixture()
      assert {:error, %Ecto.Changeset{}} = Movie.update_movies_request(movies_request, @invalid_attrs)
      assert movies_request == Movie.get_movies_request!(movies_request.id)
    end

    test "delete_movies_request/1 deletes the movies_request" do
      movies_request = movies_request_fixture()
      assert {:ok, %Movies_request{}} = Movie.delete_movies_request(movies_request)
      assert_raise Ecto.NoResultsError, fn -> Movie.get_movies_request!(movies_request.id) end
    end

    test "change_movies_request/1 returns a movies_request changeset" do
      movies_request = movies_request_fixture()
      assert %Ecto.Changeset{} = Movie.change_movies_request(movies_request)
    end
  end
end
