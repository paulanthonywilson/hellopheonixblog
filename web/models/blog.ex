defmodule HelloBlog.Blog do
  use HelloBlog.Web, :model

  schema "blogs" do
    field :author, :string
    field :title, :string
    field :content, :string

    timestamps
  end

  @required_fields ~w(author title content)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
