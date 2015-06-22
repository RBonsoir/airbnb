class Apartment < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :picture1, presence: true
end
