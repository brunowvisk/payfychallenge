defmodule PayfychallengeWeb.UsersView do
    use PayfychallengeWeb, :view

    alias Payfychallenge.User

    def render("index.json", %{user: users}) do
        Enum.map(users, &render("show.json", %{user: &1}))
    end

    def render("create.json", %{user: %User{} = user}) do
        %{
            message: "User created!",
            user: user
        }        
    end

    def render("show.json", %{user: %User{} = user}), do: %{user: user}

end

