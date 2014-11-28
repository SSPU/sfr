class Product < ActiveRecord::Base

  has_many :pictures, dependent: :destroy

  validates :sn, presence: true
  validates :sn, uniqueness: true

  CAT_OPTS = [
    ['Product'      , 0],
    ['Suit Fabric'  , 1],
    ['Shirt Fabric' , 2],
    ['Lining Fabric', 3],
  ]

  validates :cat, inclusion: { in: CAT_OPTS.map{|disp, value| value},
    message: "%{value} is not a valid category"
  }

  def cover_url
    cover = Picture.where(product_id: self.id, cover: true).take
    if cover
      cover.file.url(:medium)
    else
      nil
    end
  end

end
