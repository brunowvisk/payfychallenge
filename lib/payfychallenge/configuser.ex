defmodule Payfychallenge.Configuser do
    use Ecto.Schema
    import Ecto.Changeset

    alias Payfychallenge.User

    @fields_that_can_be_changed [
        :theme,
        :notificationemail,
        :user_id
    ]

    @required_fields [
        :theme,
        :notificationemail,
        :user_id
    ]

    @primary_key {:id, :binary_id, autogenerate: true}
    @foreign_key_type :binary_id;

    @derive {Jason.Encoder, only: @required_fields ++ [:id]}

    schema "configusers" do
        field :theme, {:array, :string}, default: ["dark", "medium", "light"]
        field :notificationemail, :boolean

        belongs_to :user, User
    end

    def changeset(%{} = params) do
        %__MODULE__{}
        |> cast(params, @fields_that_can_be_changed)
        |> validate_required(@required_fields)
    end
    
end
