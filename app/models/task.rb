class Task < ActiveRecord::Base
  belongs_to :list
  validates :description, presence: true, uniqueness: true, length: { maximum: 150 }

  def complete?
    self.completed == true
  end

  def incomplete?
    self.status == false
  end
end
