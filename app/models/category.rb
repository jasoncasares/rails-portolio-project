class Category < ActiveRecord::Base
  belongs_to :task, optional: true
  belongs_to :list, optional: true


end
