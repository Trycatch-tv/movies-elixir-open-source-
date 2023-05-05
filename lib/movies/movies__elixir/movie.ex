defmodule Movies.Movies_Elixir.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  schema "movies" do
    field :authors, {:array, :string}
    field :category, :string
    field :date_opening, :utc_datetime
    field :description, :string
    field :director, :string
    field :duration, :integer
    field :image, :string
    field :language, :string
    field :name, :string
    field :poster, :string
    field :year, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:name, :category, :date_opening, :description, :authors, :director, :year, :duration, :image, :language, :poster])
    |> validate_required([:name, :category, :date_opening, :description, :authors, :director, :year, :duration, :image, :language, :poster])
  end
end
