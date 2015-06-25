class Apartment < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  # validates :picture1, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_attached_file :picture,
    styles: { medium: "300x250>", thumb: "100x100>", large:"2000x500>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%")
  end
end
