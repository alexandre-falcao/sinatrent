class Instrument < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  belongs_to :category

  validates :name, :category_id, :description, :price, presence: true
  # add photo!!!

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
