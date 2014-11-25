class Admin::PicturesController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :index, :create, :new]
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = @product.pictures.order :order
  end

  def show
  end

  def new
    @picture = @product.pictures.build
  end

  def edit
  end

  def create
    @picture = @product.pictures.build(picture_params)

    if @picture.save
      redirect_to admin_product_picture_path(@product, @picture), notice: 'Picture was successfully created.'
    else
      render :new
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to admin_product_picture_path(@product, @picture), notice: 'Picture was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @picture.file = nil
    @picture.save
    @picture.destroy
    redirect_to admin_product_pictures_path(@product), notice: 'Picture was successfully destroyed.'
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def picture_params
    params.require(:picture).permit(:product_id, :file, :order, :cover)
  end

end
