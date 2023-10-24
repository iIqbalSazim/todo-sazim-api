class Task < ApplicationRecord
  validates :description, presence: true, length: {maximum: 1000}
end
