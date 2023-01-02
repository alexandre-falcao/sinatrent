class Instrument < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  belongs_to :category

  validates :name, :category_id, :description, :price, :photo, presence: true
end
