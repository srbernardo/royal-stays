class List < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :places, through: :bookmarks

  validates :name, presence :true, length: {minimum: 4, maximum: 30}
end
