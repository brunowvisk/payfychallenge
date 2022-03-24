defmodule PayfychallengeWeb.FallbackController do
    use PayfychallengeWeb, :controller
    
    alias PayfychallengeWeb.ErrorView

    def call(conn, {:error, %{status: status, result: changeset}}) do
        conn
        |> put_status(status)
        |> put_view(ErrorView)
        |>render("error.json", result: changeset)
    end
    
end