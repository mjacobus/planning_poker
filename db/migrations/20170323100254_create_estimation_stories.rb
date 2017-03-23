Hanami::Model.migration do
  change do
    create_table :stories do
      primary_key :id

      column :room_id, Integer
      column :url, String
      column :name, String
      column :description, String, length: 10_000
      column :estimation, String
      column :status, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
