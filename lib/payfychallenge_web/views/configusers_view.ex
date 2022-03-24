defmodule PayfychallengeWeb.ConfigusersView do
    use PayfychallengeWeb, :view

    alias Payfychallenge.Configuser

    def render("index.json", %{configuser: configusers}) do
        Enum.map(configusers, &render("show.json", %{configuser: &1}))
    end

    def render("create.json", %{configuser: %Configuser{} = configuser}) do
        %{
            message: "User config has been set!",
            configuser: configuser
        }        
    end

    def render("show.json", %{configuser: %Configuser{} = configuser}), do: %{configuser: configuser}


end