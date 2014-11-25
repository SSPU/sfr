class Picture < ActiveRecord::Base

  belongs_to :product

  has_attached_file :file, styles: {
    small:  "128x128#",
    medium: "256x256#",
    large:  "1024x1024#"
  }

  validates :product, presence: true

  validates :order, numericality: {
    only_integer:             true,
    greater_than_or_equal_to: 0,
    less_than:                100
  }

  validates_attachment :file, presence: true
  validates_attachment :file, content_type: {content_type: ['image/jpeg']}
  validates_attachment :file, size: {in: 0..2.megabytes }

end
