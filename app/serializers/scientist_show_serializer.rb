class ScientistShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar, :field_of_study
  has_many :planets
end
