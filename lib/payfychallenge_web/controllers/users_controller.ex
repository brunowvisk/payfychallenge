defmodule PayfychallengeWeb.UsersController do
    use PayfychallengeWeb, :controller

    alias Payfychallenge.User
    alias PayfychallengeWeb.FallbackController
    alias Payfychallenge.Users.Get

    action_fallback FallbackController

    require Logger

    def index(conn, _params) do
        case Get.all_users() do
            users when is_list(users) ->
            conn
            |> put_status(:ok)
            |> render("index.json", user: users)
        {:error, reason} ->
            conn
            |> put_status(400)
            |> render("error.json", result: reason)
        end
    end

    def create(conn, params) do
        with {:ok, %User{} = user} <- Payfychallenge.create_user(params) do
            Logger.info("User created!")
            conn
            |> put_status(:created)
            |> render("create.json", user: user)
        end
    end

    def show(conn, %{"id" => id}) do
        with {:ok, %User{} = user} <- Payfychallenge.get_user_by_id(id) do
            conn
            |> put_status(:ok)
            |> render("show.json", user: user)
        end
    end
    
end