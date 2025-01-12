defmodule Beef.UserBlock do
  use Ecto.Schema
  import Ecto.Changeset
  @timestamps_opts [type: :utc_datetime_usec]

  @derive {Poison.Encoder, only: [:userId, :userIdBlocked]}
  @primary_key false
  schema "user_blocks" do
    belongs_to(:user, Beef.User, foreign_key: :userId, type: :binary_id)
    belongs_to(:blockedUser, Beef.User, foreign_key: :userIdBlocked, type: :binary_id)

    timestamps()
  end

  @doc false
  def insert_changeset(userBlock, attrs) do
    userBlock
    |> cast(attrs, [:userId, :userIdBlocked])
    |> validate_required([:userId, :userIdBlocked])
  end
end
