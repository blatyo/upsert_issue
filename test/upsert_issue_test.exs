defmodule UpsertIssueTest do
  use UpsertIssue.DataCase
  alias UpsertIssue.Repo
  alias UpsertIssue.Blog.Post

  @id "e87296f6-860e-45d1-9515-fc3639fbac40"
  test "upsert update case omits default values" do
    %Post{}
    |> Post.changeset(%{id: @id, deleted_at: DateTime.utc_now()})
    |> Repo.insert!(conflict_target: :id, on_conflict: :replace_all)

    # Value in database has deleted_at set to a datetime, but new struct here has
    # deleted_at set to nil. So when the update portion of the upsert is called,
    # Ecto has omitted deleted_at's value. That means in the struct returned
    # deleted_at is nil, but Ecto never set the value of deleted_at to nil in the
    # database.
    updated_post =
      %Post{}
      |> Post.changeset(%{id: @id, deleted_at: nil})
      |> Repo.insert!(conflict_target: :id, on_conflict: :replace_all)

    db_post = Repo.get!(Post, @id)

    assert db_post.deleted_at == updated_post.deleted_at
  end
end
