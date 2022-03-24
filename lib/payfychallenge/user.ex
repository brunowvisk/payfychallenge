defmodule Payfychallenge.User do
    use Ecto.Schema
    import Ecto.Changeset

    @fields_that_can_be_changed [
        :name,
        :age,
        :email
    ]

    @required_fields [
        :name,
        :age,
        :email
    ]

    @primary_key {:id, :id, autogenerate: true}

    schema "users" do
        field :name, :string
        field :age, :integer
        field :email, :string

        @derive {Jason.Encoder, only: [:id, :name, :age, :email]}
    end

    def changeset(%{} = params) do
        %__MODULE__{}
        |> cast(params, @fields_that_can_be_changed)
        |> validate_required(@required_fields)
        |> unique_constraint([:email])
        |> validate_number(:age, greater_than_or_equal_to: 18)
        |> validate_format(:email, ~r/@/)
    end

end