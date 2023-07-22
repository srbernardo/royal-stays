class Place < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :title, :address, :description, :image, presence: true
  validates :title, :address, uniqueness: true
  validates :description, length: {minimum:12, maximum:200}
end
