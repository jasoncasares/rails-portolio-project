class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :due_date
end
