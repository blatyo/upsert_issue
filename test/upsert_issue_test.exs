defmodule UpsertIssueTest do
  use UpsertIssue.DataCase
  alias UpsertIssue.Repo
  alias UpsertIssue.Blog.Post

  @id "e87296f6-860e-45d1-9515-fc3639fbac40"
  test "upsert update case omits default values" do
    %Post{}
    |> Post.changeset(%{id: @id, deleted_at: DateTime.utc_now()})
    |> Repo.insert!(conflict_target: :id, on_conflict: :replace_all)

    updated_post =
      %Post{}
      |> Post.changeset(%{id: @id, deleted_at: nil})
      |> Repo.insert!(conflict_target: :id, on_conflict: :replace_all)

    db_post = Repo.get!(Post, @id)

    assert db_post.deleted_at == updated_post.deleted_at
  end
end
