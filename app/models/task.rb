class Task < ApplicationRecord
  validates :description, presence: true, length: {maximum: 1000}
  validates :priority, presence: true
  validates :due_date, presence: true
end
