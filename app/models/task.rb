class Task < ApplicationRecord
  belongs_to :lists
  validates_presence_of :title, :description, :due_date, :status
end
