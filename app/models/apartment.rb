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
    styles: { medium: "300x250>", thumb: "100x100>", large:"1500x300>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
