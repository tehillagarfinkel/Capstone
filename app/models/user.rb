class User < ApplicationRecord
  has_secure_password
  has_many :categories

  def tasks
    result = []
    categories.each do |category|
      category.tasks.each do |task|
        result << task
      end
    end
    result
  end
end
