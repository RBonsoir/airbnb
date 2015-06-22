class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :apartment
  validates :checkin_on, presence: true
  validates :checkout_on, presence: true
  validates :user_id, presence: true
  validates :apartment_id, presence: true
end
