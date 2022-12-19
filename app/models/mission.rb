class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

  validates :name, presence: true
  # validates :scientist, presence: true
  # validates :scientist_id, presence: true, in also a scientist
  # validates :planet, presence: true
  validates :scientist, uniqueness: true

end
