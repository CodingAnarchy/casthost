defmodule Casthost.PodcastTest do
  use Casthost.DataCase

  alias Casthost.Podcast

  describe "series" do
    alias Casthost.Podcast.Series

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def series_fixture(attrs \\ %{}) do
      {:ok, series} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Podcast.create_series()

      series
    end

    test "list_series/0 returns all series" do
      series = series_fixture()
      assert Podcast.list_series() == [series]
    end

    test "get_series!/1 returns the series with given id" do
      series = series_fixture()
      assert Podcast.get_series!(series.id) == series
    end

    test "create_series/1 with valid data creates a series" do
      assert {:ok, %Series{} = series} = Podcast.create_series(@valid_attrs)
      assert series.name == "some name"
    end

    test "create_series/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Podcast.create_series(@invalid_attrs)
    end

    test "update_series/2 with valid data updates the series" do
      series = series_fixture()
      assert {:ok, series} = Podcast.update_series(series, @update_attrs)
      assert %Series{} = series
      assert series.name == "some updated name"
    end

    test "update_series/2 with invalid data returns error changeset" do
      series = series_fixture()
      assert {:error, %Ecto.Changeset{}} = Podcast.update_series(series, @invalid_attrs)
      assert series == Podcast.get_series!(series.id)
    end

    test "delete_series/1 deletes the series" do
      series = series_fixture()
      assert {:ok, %Series{}} = Podcast.delete_series(series)
      assert_raise Ecto.NoResultsError, fn -> Podcast.get_series!(series.id) end
    end

    test "change_series/1 returns a series changeset" do
      series = series_fixture()
      assert %Ecto.Changeset{} = Podcast.change_series(series)
    end
  end

  describe "episodes" do
    alias Casthost.Podcast.Episode

    @valid_attrs %{description: "some description", downloads: 42, number: 42, name: "some name", uploaded_at: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{description: "some updated description", downloads: 43, number: 43, name: "some updated name", uploaded_at: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{description: nil, downloads: nil, number: nil, name: nil, uploaded_at: nil}

    def episode_fixture(attrs \\ %{}) do
      {:ok, episode} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Podcast.create_episode()

      episode
    end

    test "list_episodes/0 returns all episodes" do
      episode = episode_fixture()
      assert Podcast.list_episodes() == [episode]
    end

    test "get_episode!/1 returns the episode with given id" do
      episode = episode_fixture()
      assert Podcast.get_episode!(episode.id) == episode
    end

    test "create_episode/1 with valid data creates a episode" do
      assert {:ok, %Episode{} = episode} = Podcast.create_episode(@valid_attrs)
      assert episode.description == "some description"
      assert episode.downloads == 42
      assert episode.number == 42
      assert episode.name == "some name"
      assert episode.uploaded_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_episode/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Podcast.create_episode(@invalid_attrs)
    end

    test "update_episode/2 with valid data updates the episode" do
      episode = episode_fixture()
      assert {:ok, episode} = Podcast.update_episode(episode, @update_attrs)
      assert %Episode{} = episode
      assert episode.description == "some updated description"
      assert episode.downloads == 43
      assert episode.number == 43
      assert episode.name == "some updated name"
      assert episode.uploaded_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_episode/2 with invalid data returns error changeset" do
      episode = episode_fixture()
      assert {:error, %Ecto.Changeset{}} = Podcast.update_episode(episode, @invalid_attrs)
      assert episode == Podcast.get_episode!(episode.id)
    end

    test "delete_episode/1 deletes the episode" do
      episode = episode_fixture()
      assert {:ok, %Episode{}} = Podcast.delete_episode(episode)
      assert_raise Ecto.NoResultsError, fn -> Podcast.get_episode!(episode.id) end
    end

    test "change_episode/1 returns a episode changeset" do
      episode = episode_fixture()
      assert %Ecto.Changeset{} = Podcast.change_episode(episode)
    end
  end
end
