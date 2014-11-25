class Product < ActiveRecord::Base

  has_many :pictures, dependent: :destroy

  validates :sn, presence: true
  validates :sn, uniqueness: true

end
