class Product < ActiveRecord::Base

  has_many :pictures, dependent: :destroy

  validates :sn, presence: true
  validates :sn, uniqueness: true

  def cover_url
    cover = Picture.where(product_id: self.id, cover: true).take
    if cover
      cover.file.url(:medium)
    else
      nil
    end
  end

end
