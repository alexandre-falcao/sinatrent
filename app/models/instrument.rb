class Instrument < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, :price, :instrument_type, :photo, presence: true
end
