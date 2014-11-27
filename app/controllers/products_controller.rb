class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.where active: true
    @covers = []
    @products.each do |product|
      @covers << product.cover_url
    end
    render json: {products: @products, covers: @covers}, status: :ok
  end

  def show
    @pictures = @product.pictures
    @large_pictures = []
    @pictures.each do |picture|
      @large_pictures << picture.file.url(:large)
    end
    render json: {product: @product, pictures: @large_pictures}, status: :ok
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

end
