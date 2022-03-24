defmodule Payfychallenge.Configusers.Get do
    alias Payfychallenge.Repo
    alias Payfychallenge.Configuser

    def by_id(id) do
        case Repo.get(Configuser, id) do
            nil -> {:error, %{status: :not_found, result: "User config not found!"}}
            user_schema -> {:ok, user_schema}
        end
    end

    def all_configusers do
        Repo.all(Configuser)
    end
    
    
end