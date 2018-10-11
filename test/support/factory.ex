defmodule Casthost.Factory do
  use ExMachina.Ecto, repo: Casthost.Repo
  use Casthost.UserFactory
end
