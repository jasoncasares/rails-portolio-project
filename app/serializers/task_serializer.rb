class TaskSerializer < ActiveModel::Serializer
  attributes :id, :description, :completed
  has_many :lists
end
