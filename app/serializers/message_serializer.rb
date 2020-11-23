class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :username
end
