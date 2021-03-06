defmodule Screamer.Message do
  use Screamer.Web, :model

  @primary_key {:id, :binary_id, autogenerate: false}
  @foreign_key_type :binary_id
  schema "messages" do
    field :body, :string
    belongs_to :conversation, Screamer.Conversation

    timestamps
  end

  @required_fields ~w(id body)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
