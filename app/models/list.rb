class List < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :due_date, presence: true

  scope :overdue, lambda { where('due_date: <= ?', Date.today) }

end
