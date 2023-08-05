class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :castle

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :check_dates
  validate :check_rented
  # validate :date_range_validation

  private

  def check_dates
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    elsif end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    elsif end_date < start_date
      errors.add(:end_date, "can't be before the start date")
    end
  end

  def check_rented
    rentals = Rental.where(castle: self.castle)
    rentals.each do |rental|
      if (rental.start_date..rental.end_date).include?(start_date..end_date)
        errors.add(:end_date, "The selected date is not available")
      end
    end
  end

  # def date_range_validation
  #   if start_date.present? && end_date.present? && ((end_date - start_date) < 2.days || (end_date - start_date) > 7.days)
  #     "Tudo certo"
  #   else
  #     errors.add(:end_date, "deve estar entre 2 e 7 dias após a ffffffffffffffffffffdata de início")
  #   end
  # end
end
