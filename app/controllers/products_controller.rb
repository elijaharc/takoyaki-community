class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :auth_region
  before_action :set_seller_page
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products
  def index
    @products = current_user.seller_page.products
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = @seller_page.products.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = @seller_page.products.build(product_params)
    @product.seller_page_id = current_user.seller_page.id
    
    if @product.save
      redirect_to seller_page_products_path(@product), notice: "Product was successfully created."
    else
     render action: 'new'
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      byebug
      redirect_to seller_page_product_path(@product), notice: "Product was successfully updated."
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_back(fallback_location: root_path, notice: "Product was successfully deleted.")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller_page
      @seller_page = current_user.seller_page
    end

    def set_product
      @product = @seller_page.products.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:product_name, :product_description, :price, :available, :seller_page_id)
    end
end