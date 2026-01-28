class CreateTaskAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :task_assignments do |t|
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.date :start_date
      t.date :due_date
      t.datetime :completed_at

      t.timestamps
    end
    add_index :task_assignments, [:task_id, :user_id], unique: true
  end
end
