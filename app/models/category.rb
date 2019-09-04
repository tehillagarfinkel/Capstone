class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks

  def sorted_tasks
    tasks.sort_by { |task| task.due_date }
  end
end
