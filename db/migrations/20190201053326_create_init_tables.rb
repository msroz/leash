Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id
      column :name, String, null: false, unique: true, index: true
      column :email, String, null: false, unique: true, index: true
      column :password_digest, String, null: false
      column :deleted_at, DateTime, null: true, index: true
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end

    create_table :entries do
      primary_key :id
      foreign_key :author_id, :users, on_delete: :cascade, null: false
      column :title, String, null: false
      column :body, "text", null: false
      column :deleted_at, DateTime, null: true
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end

    create_table :comments do
      primary_key :id
      foreign_key :entry_id, :entries, on_delete: :cascade, null: false
      foreign_key :author_id, :users, on_delete: :cascade, null: false
      column :body, "text", null: false
      column :deleted_at, DateTime, null: true
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end

