defmodule Payfychallenge.Users.Create do

    alias Payfychallenge.User
    alias Payfychallenge.Repo

    def call(%{} = params) do
        params
        |> User.changeset()
        |> Repo.insert()
        |> handle_insert()
    end

    def call(_anything), do: "Data in a map format needed!"

    defp handle_insert({:ok, %User{}} = result), do: result

    defp handle_insert({:error, changeset}) do
        {:error, %{status: :bad_request, result:  changeset}}
    end
    
end