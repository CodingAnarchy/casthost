defmodule Casthost.Podcast.Series do
  use Ecto.Schema
  import Ecto.Changeset


  schema "series" do
    field :name, :string
    has_many :episodes, Casthost.Podcast.Episode

    timestamps()
  end

  @doc false
  def changeset(series, attrs) do
    series
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
