class Task < ActiveRecord::Base
  has_many :lists, :through => :categories

  validates :description, presence: true, uniqueness: true, length: { maximum: 150 }

  def complete?
    self.completed == true
  end

  def incomplete?
    self.status == false
  end
end
