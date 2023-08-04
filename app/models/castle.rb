class Castle < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :photo

  validates :name, :address, presence: true, uniqueness: true
  validates :daily_rate, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 999999 }
  validates :photo, presence: true

  pg_search_scope :rental_search,
                  against: %i[name address],
                  using: {
                    tsearch: { prefix: true }
                  }
end
