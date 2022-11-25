class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument
  validate :other_booking_overlap
  validate :return_date_after_start_date
  validate :start_date_after_today

  def period
    (start_date..return_date)
  end

  def other_booking_overlap
    # run this validation if the other ones did pass
    if errors.blank?
      other_bookings = self.instrument.bookings
      # Look for overlaping periods
      overlapping_bookings = other_bookings.select do |other_booking|
        self.period.overlaps?(other_booking.period)
      end
      # Check if the start date is available
      overlapping_start_date = other_bookings.find do |other_booking|
        other_booking.start_date == start_date
      end
      # Check if the return date is available
      overlapping_return_date = other_bookings.find do |other_booking|
        other_booking.return_date == return_date
      end

      # Display error if we don't find any overlapping period and overlapping date
      is_overlapping = !overlapping_bookings.empty?
      is_overlapping_start_date = !overlapping_start_date.nil?
      is_overlapping_return_date = !overlapping_return_date.nil?
      errors.add(:start_date, "is not available") if is_overlapping_start_date
      errors.add(:start_date, "is overlapping") if is_overlapping
      errors.add(:return_date, "is not available") if is_overlapping_return_date
      errors.add(:return_date, "is overlapping") if is_overlapping
    end
  end

  def return_date_after_start_date
    return if return_date.blank? || start_date.blank?
    errors.add(:return_date, "must be after the start date") if return_date < start_date
  end

  def start_date_after_today
    errors.add(:start_date, "must be after today") if start_date <= Date.today
  end

end
