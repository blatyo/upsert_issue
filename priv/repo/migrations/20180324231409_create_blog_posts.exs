defmodule UpsertIssue.Repo.Migrations.CreateBlogPosts do
  use Ecto.Migration

  def change do
    create table(:blog_posts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :deleted_at, :naive_datetime

      timestamps()
    end

  end
end
