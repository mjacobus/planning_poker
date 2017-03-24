Hanami::Model.migration do
  change do
    create_table :estimation_rounds do
      primary_key :id

      column :story_id, Integer
      column :sequence, Integer
      column :status, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
