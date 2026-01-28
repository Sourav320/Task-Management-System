class CreateJoinTableRolesUsers < ActiveRecord::Migration[8.0]
  def change
    create_join_table :roles, :users do |t|
      t.index :role_id
      t.index :user_id
      t.index [:role_id, :user_id], unique: true
    end
  end
end
