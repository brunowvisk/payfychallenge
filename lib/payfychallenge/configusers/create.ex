defmodule Payfychallenge.Configusers.Create do
    alias Payfychallenge.Configuser
    alias Payfychallenge.Repo

    def call(%{} = params) do
        params
        |> Configuser.changeset()
        |> Repo.insert()
        |> handle_insert()
    end

    def call(_anything), do: "Data in a map format needed!"

    defp handle_insert({:ok, %Configuser{}} = result), do: result

    defp handle_insert({:error, changeset}) do
        {:error, %{status: :bad_request, result:  changeset}}
    end
    
end