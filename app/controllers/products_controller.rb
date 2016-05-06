class ProductsController < ApplicationController
  before_filter :authorize_user
  before_action :set_band, only: [:index, :create, :destroy]

  def index
    @products = @band.products.all
    @product = @band.products.new
  end

  def create
    @product = @band.products.new product_params
    if @product.save
      redirect_to :back
      flash[:"is-success"] = 'Rock on!You have created a new product'
    else
      @errors = @product.errors.full_messages
      redirect_to :back
      flash[:"is-alert"] = 'Oops!Something went wrong...'
    end
  end

  def destroy
    @product = @band.products.find(params[:id])
    if @product.destroy
      flash[:"is-success"] = 'Product deleted'
    else
      @errors = @product.errors.full_messages
      flash[:"is-alert"] = 'Oops!Something went wrong...'
    end
    redirect_to :back
  end

  private

  def set_band
    @band = current_user.bands.find(params[:band_id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :image, :quantity)
  end
end
