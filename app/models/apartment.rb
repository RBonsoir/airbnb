class Apartment < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  # validates :picture1, presence: true

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
