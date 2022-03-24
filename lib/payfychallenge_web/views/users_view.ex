defmodule PayfychallengeWeb.UsersView do
    use PayfychallengeWeb, :view

    alias Payfychallenge.User

    # def render("index.json", %{users: users}) do
    #     %{
    #         users: Enum.map(users, fn(user) -> user_json(user)
    #     end)}
    # end

    # defp user_json(user) do
    #     %{
    #         id: user.id,
    #         name: user.name,
    #         age: user.
    #     }
    # end

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

