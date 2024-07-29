class Castle < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :photo

  validates :name, :address, presence: true, uniqueness: true
  validates :daily_rate, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 999999 }
  validates :photo, presence: true

  def self.rental_search(query)
    where("name LIKE :query OR address LIKE :query", query: "%#{query}%")
  end
end
