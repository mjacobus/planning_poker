Hanami::Model.migration do
  change do
    create_table :round_participants do
      primary_key :id

      column :user_id, Integer
      column :estimation_round_id, Integer
      column :estimation, String, null: true

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
