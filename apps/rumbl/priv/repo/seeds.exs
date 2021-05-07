# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rumbl.Repo.insert!(%Rumbl.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Rumbl.Repo
alias Rumbl.Category
alias Rumbl.User
alias Rumbl.Video

# create categories
categories = ~w(Action Drama Romance Comedy Sci-fi Technology)
for category <- categories do
  Repo.get_by(Category, name: category) ||
    Repo.insert!(%Category{name: category})
end

# create app user
Repo.get_by(User, username: "rumbl-app") ||
  Repo.insert!(%User{name: "Rumbl Application", username: "rumbl-app"})

# create wolfram user
Repo.get_by(User, username: "wolfram") ||
  Repo.insert!(%User{name: "Wolfram|Alpha API", username: "wolfram"})

# create videos
videos = [
  %{
    url: "https://www.youtube.com/watch?v=xrIjfIjssLE",
    title: "Erlang: The Movie",
    description: "Demo of the Erlang programming language from Ericsson."
  },
  %{
    url: "https://www.youtube.com/watch?v=lxYFOM3UJzo",
    title: "Elixir: The Documentary",
    description: "Explore the origins of Elixir."
  },
  %{
    url: "https://www.youtube.com/watch?v=u21S_vq5CTw",
    title: "Phoenix Takes Flight (ElixirConf EU 2015)",
    description: "Chris McCord's keynote on Phoenix."
  }
]

for video_attrs <- videos do
  changeset = Repo.get_by!(User, username: "rumbl-app")
  |> Ecto.build_assoc(:videos)
  |> Video.changeset(video_attrs)

  Repo.get_by(Video, url: video_attrs.url) || Repo.insert!(changeset)
end
