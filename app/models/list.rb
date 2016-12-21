class List < ActiveRecord::Base
  has_many :tasks, :through => :categories, dependent: :destroy
  has_many :categories

  validates :name, presence: true
  validates :due_date, presence: true

  def overdue?
    if (due_date < Time.now)
      "List is Overdue"
    end
  end


end
