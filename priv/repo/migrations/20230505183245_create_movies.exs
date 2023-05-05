defmodule Movies.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movie) do
      add :name, :string
      add :category, :string
      add :date_opening, :utc_datetime
      add :description, :string
      add :authors, {:array, :string}
      add :director, :string
      add :year, :utc_datetime
      add :duration, :integer
      add :image, :string
      add :language, :string
      add :poster, :string

      timestamps()
    end
  end
end
