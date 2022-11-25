class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument
  validate :other_booking_overlap

  def period
    (start_date..return_date)
  end

  def other_booking_overlap
    # run this validation if the other ones did pass
    if errors.blank?
      other_bookings = self.instrument.bookings
      overlapping_bookings = other_bookings.select do |other_booking|
        self.period.overlaps?(other_booking.period)
      end
      is_overlapping = !overlapping_bookings.empty?
      errors.add(:start_date, "is not available") if is_overlapping
    end
  end
end
