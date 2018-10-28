defmodule Casthost.Podcast.Episode do
  use Ecto.Schema
  import Ecto.Changeset

  alias Casthost.Podcast

  schema "episodes" do
    field :description, :string
    field :downloads, :integer
    field :episode_number, :integer
    field :name, :string
    field :series_id, :id

    timestamps()
  end

  @doc false
  def changeset(episode, attrs) do
    episode
    |> cast(attrs, [:name, :description, :downloads, :series_id])
    |> validate_required([:name, :description, :downloads, :series_id])
    |> put_episode_number()
    |> unique_constraint(:unique_episode_number, :index_episodes_on_series_and_number)
  end

  defp put_episode_number(changeset) do
    case get_field(changeset, :number, nil) do
      nil ->
        series = Podcast.get_series!(get_field(changeset, :series_id))
        put_change(changeset, :number, Podcast.next_episode_number(series))
      _ ->
        changeset
    end
  end
end
