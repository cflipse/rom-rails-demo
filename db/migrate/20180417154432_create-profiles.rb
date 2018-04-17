# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :profiles do
      primary_key :id

      column :email, String, null: false, unique: true, index: true
      column :display_name, String

      column :private_email, TrueClass, default: true

      column :bio, :text
      column :state, String, default: "active", index: true
    end
  end
end
