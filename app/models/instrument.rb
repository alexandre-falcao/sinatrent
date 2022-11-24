class Instrument < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings

  validates :name, :price, :instrument_type, :photo, presence: true
end
