defmodule Payfychallenge.Users.Get do
    alias Payfychallenge.Repo
    alias Payfychallenge.User

    def by_id(id) do
        case Repo.get(User, id) do
            nil -> {:error, %{status: :not_found, result: "User not found!"}}
            user_schema -> {:ok, user_schema}
        end
    end

    def all_users do
        Repo.all(User)
    end
    
    
end