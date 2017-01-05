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

  def categories=(category_attributes)
    self.categories.build(category_attributes)
  end


end
