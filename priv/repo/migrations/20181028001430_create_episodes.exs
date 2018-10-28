defmodule Casthost.Repo.Migrations.CreateEpisodes do
  use Ecto.Migration

  def change do
    create table(:episodes) do
      add :name, :string
      add :description, :text
      add :number, :integer
      add :downloads, :integer, null: false, default: 0
      add :series_id, references(:series, on_delete: :nothing)

      timestamps()
    end

    create index(:episodes, [:series_id])
    create unique_index(:episodes, [:series_id, :number], name: :index_episodes_on_series_and_number)
  end
end
