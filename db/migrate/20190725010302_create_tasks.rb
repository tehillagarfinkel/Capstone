class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :category_id
      t.boolean :completed, default: false
      t.datetime :start
      t.integer :duration
      t.datetime :due_date

      t.timestamps
    end
  end
end
