defmodule Payfychallenge do
  @moduledoc """
  Payfychallenge keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Payfychallenge.Users.Create, as: UserCreate
  alias Payfychallenge.Users.Get, as: UserGet
  alias Payfychallenge.Configusers.Create, as: ConfiguserCreate
  alias Payfychallenge.Configusers.Get, as: ConfiguserGet

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id

  defdelegate set_configuser(params), to: ConfiguserCreate, as: :call
  defdelegate get_configuser_by_id(id), to: ConfiguserGet, as: :by_id

end
