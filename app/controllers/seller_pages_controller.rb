class SellerPagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_seller_page, only: %i[ index edit update destroy ]

  # GET /seller_page
  def index
  end

  # GET /seller_pages/new
  def new
    @seller_page = SellerPage.new
  end

  # GET /seller_pages/:id/edit
  def edit
  end

  # POST /seller_pages
  def create
    @seller_page = SellerPage.new(seller_page_params)
    @seller_page.user_id = current_user.id

    if @seller_page.save
        redirect_to seller_pages_path, notice: "Seller page was successfully created."
    else
       render action: 'new'
    end
  end

  # PATCH/PUT /seller_pages/:id
  def update
    if @seller_page.update(seller_page_params)
        redirect_to seller_pages_path, notice: "Seller page was successfully updated."
    else
      render action: 'edit'
    end
  end

  # DELETE 
  def destroy
    @seller_page.destroy
    redirect_to seller_pages_path, notice: "Seller page was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller_page
      @seller_page = current_user.seller_page
    end

    # Only allow a list of trusted parameters through.
    def seller_page_params
      params.require(:seller_page).permit(:business_name, :business_info, :phone_number, :verified, :user_id)    
    end
end
