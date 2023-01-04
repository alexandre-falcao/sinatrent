class Instrument < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  belongs_to :category

  validates :name, :category_id, :description, :street, :number, :district, :city, :state, :price, :photo, presence: true

  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  after_validation :geocode, if: ->(obj){ obj.street.present? and obj.street_changed? and obj.number.present? and obj.number_changed? and obj.district.present? and obj.district_changed? and obj.city.present? and obj.city_changed? and obj.state.present? and obj.state_changed? }

  def address
    [street, number, district, city, state].compact.join(', ')
  end

end
