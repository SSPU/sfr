class ProductsController < ApplicationController
  before_action :set_pictures

  def index
    get_products
    get_covers_from @products
    render json: {products: @products, pictures: @pictures}, status: :ok
  end

  def show
    @product          = Product.find(params[:id])
    @product_pictures = @product.pictures
    @product_pictures.each do |p|
      @pictures << p.file.url(:large)
    end
    render json: {product: @product, pictures: @pictures}, status: :ok
  end

  def suit_fabrics
    get_suit_fabrics
    get_first_pictures_from @suit_fabrics
    render json: {products: @suit_fabrics, pictures: @pictures}, status: :ok
  end

  def shirt_fabrics
    get_shirt_fabrics
    get_first_pictures_from @shirt_fabrics
    render json: {products: @shirt_fabrics, pictures: @pictures}, status: :ok
  end

  def lining_fabrics
    get_lining_fabrics
    get_first_pictures_from @lining_fabrics
    render json: {products: @lining_fabrics, pictures: @pictures}, status: :ok
  end

  private

  def set_pictures
    @pictures = []
  end

  #Return Products []
  def get_products
    @products = Product.where(active: true, cat: 0)
  end

  #Return Products []
  def get_suit_fabrics
    @suit_fabrics = Product.where(active: true, cat: 1)
  end

  #Return Products []
  def get_shirt_fabrics
    @shirt_fabrics = Product.where(active: true, cat: 2)
  end

  #Return Products []
  def get_lining_fabrics
    @lining_fabrics = Product.where(active: true, cat: 3)
  end

  #Return Pictures [] - only url
  def get_covers_from(products)
    products.each do |p|
      @pictures << p.cover_url
    end
  end

  #Return Pictures [] - only url
  def get_first_pictures_from(products)
    products.each do |p|
      @pictures << p.pictures.first.file.url(:large)
    end
  end

end
