class List < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :due_date, presence: true

  def self.overdue?
    if due_date.past?
      errors.add(:due_date, 'Past Due')
    end
  end

end
