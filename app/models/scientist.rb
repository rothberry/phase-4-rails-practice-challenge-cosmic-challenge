class Scientist < ApplicationRecord
  has_many :missions, dependent: :destroy
  has_many :planets, through: :missions

  # * ALL ONE LINERS
  # validates :name, presence: true
  # validates :field_of_study, presence: true
  # validates :name, uniqueness: true
  
  # * COMBINE ALL COLUMNS
  # validates :name, presence: true, uniqueness: true
  # validates :field_of_study, presence: true

  # * COMBINE ALL THE TYPES
  validates :name, :field_of_study, presence: true
  validates :name, uniqueness: true



end
