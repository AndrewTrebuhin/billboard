class CreateUsersRoles < ActiveRecord::Migration
  def change
    create_table :users_roles, id: false do |t|
      t.references :user, index: true
      t.references :role, index: true
    end
  end
end
