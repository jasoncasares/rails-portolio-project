class List < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :due_date, presence: true

  def overdue?
    if (due_date < Time.now)
      "List is Overdue"
    end
  end


end
