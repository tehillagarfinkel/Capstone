class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :user_id
      t.integer :category_id
      t.boolean :completed
      t.datetime :start
      t.integer :duration
      t.datetime :due_date

      t.timestamps
    end
  end
end
