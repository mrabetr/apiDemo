class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    products = Product.all
    render json: products, status: 200
  end

  def show
    if product
      render json: product, status: 200
    else
      render json: { error: "Product not found" }
    end
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: 200
    else
      render json: { error: "Error creating, review" }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :brand, :price, :description)
  end
end
