class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login,     :string
    add_column :users, :full_name, :string
    add_column :users, :birthday,  :date
    add_column :users, :zip,       :integer
    add_column :users, :country,   :string
    add_column :users, :state,     :string
    add_column :users, :city,      :string
    add_column :users, :address,   :string
    add_column :users, :role, :string, default: :user
  end
end
