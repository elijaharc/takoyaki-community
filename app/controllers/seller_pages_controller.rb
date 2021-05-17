class SellerPagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_seller_page, only: %i[ index ]

  # GET /seller_page
  def index
  end

  # GET /seller_pages/new
  def new
    @seller_page = SellerPage.new
  end

  # GET /seller_pages/1/edit
  def edit
  end

  # POST /seller_pages or /seller_pages.json
  def create
    @seller_page = SellerPage.new(seller_page_params)
    @seller_page.user_id = current_user.id

    if @seller_page.save
        redirect_to seller_pages_path, notice: "Seller page was successfully created."
    else
       render action: 'new'
    end
  end

  # PATCH/PUT /seller_pages/1 or /seller_pages/1.json
  def update
    respond_to do |format|
      if @seller_page.update(seller_page_params)
        format.html { redirect_to @seller_page, notice: "Seller page was successfully updated." }
        format.json { render :show, status: :ok, location: @seller_page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @seller_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seller_pages/1 or /seller_pages/1.json
  def destroy
    @seller_page.destroy
    respond_to do |format|
      format.html { redirect_to seller_pages_url, notice: "Seller page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller_page
      @seller_page = current_user.seller_page
    end

    # Only allow a list of trusted parameters through.
    def seller_page_params
      params.require(:seller_page).permit(:business_name, :business_info, :verified, :user_id)    
    end
end
