defmodule Payfychallenge.Configuser do
    use Ecto.Schema

    @primary_key {:id, :id, autogenerate: true}

    schema "configusers" do
        field :theme, {:array, :string}, default: ["dark", "medium", "light"]
        field :notificationemail, :boolean

    end
    
end