class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :availability, :slack
end
