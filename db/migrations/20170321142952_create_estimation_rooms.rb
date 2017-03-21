Hanami::Model.migration do
  change do
    create_table :estimation_rooms do
      primary_key :id

      column :name, String
      column :description, String, size: 10_000
      column :admin_uuid, String, unique: true
      column :voting_uuid, String, unique: true

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
