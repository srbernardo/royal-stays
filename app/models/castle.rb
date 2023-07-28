class Castle < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_one_attached :photo

  validates :name, :address, presence: true
  validates :daily_rate, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 999999 }
end
