class Place < ApplicationRecord
  belongs_to :user

  validates :title, :address, :description, :image, presence: true
  validates :title, :address, uniqueness: true
  validates :description, length: {minimum:12, maximum:200}
end
