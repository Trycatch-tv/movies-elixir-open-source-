defmodule MoviesWeb.Movies_requestControllerTest do
  use MoviesWeb.ConnCase

  import Movies.MovieFixtures

  alias Movies.Movie.Movies_request

  @create_attrs %{
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
  }
  @update_attrs %{
    authors: ["option1"],
    category: "some updated category",
    date_opening: ~U[2023-05-05 19:08:00Z],
    description: "some updated description",
    director: "some updated director",
    duration: 43,
    image: "some updated image",
    language: "some updated language",
    name: "some updated name",
    poster: "some updated poster",
    year: ~U[2023-05-05 19:08:00Z]
  }
  @invalid_attrs %{authors: nil, category: nil, date_opening: nil, description: nil, director: nil, duration: nil, image: nil, language: nil, name: nil, poster: nil, year: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all movies", %{conn: conn} do
      conn = get(conn, ~p"/api/movies")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create movies_request" do
    test "renders movies_request when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/movies", movies_request: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/movies/#{id}")

      assert %{
               "id" => ^id,
               "authors" => ["option1", "option2"],
               "category" => "some category",
               "date_opening" => "2023-05-04T19:08:00Z",
               "description" => "some description",
               "director" => "some director",
               "duration" => 42,
               "image" => "some image",
               "language" => "some language",
               "name" => "some name",
               "poster" => "some poster",
               "year" => "2023-05-04T19:08:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/movies", movies_request: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update movies_request" do
    setup [:create_movies_request]

    test "renders movies_request when data is valid", %{conn: conn, movies_request: %Movies_request{id: id} = movies_request} do
      conn = put(conn, ~p"/api/movies/#{movies_request}", movies_request: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/movies/#{id}")

      assert %{
               "id" => ^id,
               "authors" => ["option1"],
               "category" => "some updated category",
               "date_opening" => "2023-05-05T19:08:00Z",
               "description" => "some updated description",
               "director" => "some updated director",
               "duration" => 43,
               "image" => "some updated image",
               "language" => "some updated language",
               "name" => "some updated name",
               "poster" => "some updated poster",
               "year" => "2023-05-05T19:08:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, movies_request: movies_request} do
      conn = put(conn, ~p"/api/movies/#{movies_request}", movies_request: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete movies_request" do
    setup [:create_movies_request]

    test "deletes chosen movies_request", %{conn: conn, movies_request: movies_request} do
      conn = delete(conn, ~p"/api/movies/#{movies_request}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/movies/#{movies_request}")
      end
    end
  end

  defp create_movies_request(_) do
    movies_request = movies_request_fixture()
    %{movies_request: movies_request}
  end
end
