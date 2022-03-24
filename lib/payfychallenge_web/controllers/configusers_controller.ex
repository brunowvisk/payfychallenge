defmodule PayfychallengeWeb.ConfigusersController do
    use PayfychallengeWeb, :controller
    
    alias Payfychallenge.Configuser
    alias PayfychallengeWeb.FallbackController

    alias Payfychallenge.Configusers.Get

    action_fallback FallbackController

    # require Logger

    def index(conn, _params) do
        case Get.all_configusers() do
            configusers when is_list(configusers) ->
            conn
            |> put_status(:ok)
            |> render("index.json", configuser: configusers)
        {:error, reason} ->
            conn
            |> put_status(400)
            |> render("error.json", result: reason)
        end
    end

    def create(conn, params) do
        with {:ok, %Configuser{} = configuser} <- Payfychallenge.set_configuser(params) do
            # Logger.info("User config has been set!")
            conn
            |> put_status(:created)
            |> render("create.json", configuser: configuser)
        end
    end

    def show(conn, %{"id" => id}) do
        with {:ok, %Configuser{} =  configuser} <- Payfychallenge.get_configuser_by_id(id) do
            conn
            |> put_status(:ok)
            |> render("show.json", configuser: configuser)
        end
    end
end