defmodule UpsertIssue.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: false}
  @foreign_key_type :binary_id
  schema "blog_posts" do
    field :deleted_at, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    cast(post, attrs, [:id, :deleted_at])
  end
end
