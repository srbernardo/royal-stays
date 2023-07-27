class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :castle

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :date_range_validation

  private

  def date_range_validation
    if start_date.present? && end_date.present? && (end_date - start_date) < 2.days || (end_date - start_date) > 7.days
      errors.add(:end_date, "deve estar entre 2 e 7 dias após a data de início")
    end
  end
end
