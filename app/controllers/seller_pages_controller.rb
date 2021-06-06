class SellerPagesController < ApplicationController
  before_action :auth_region
  before_action :set_seller_page, only: %i[ show edit update destroy ]

  # Authy Verification
  def verify
    @seller_page = current_user.seller_page
    if params[:token].present? && params[:seller_page_id].present?
      AuthyVerification.new(params[:token], params[:seller_page_id])
      if @seller_page.verified == true
        redirect_to seller_page_path(params[:seller_page_id]), notice: "Your account is now verified. Thank you!"
      else
        flash[:notice] = "Sorry, the code you entered is invalid. Please try again."
        render action: 'verify'
      end
    else
      flash[:notice] = "Please enter the OTP sent to your phone."
      render action: 'verify'
    end
  end

  # GET /seller_page
  def index
    if params[:user][:city].present?
@seller_pages = SellerPage.where(region: params[:user][:region], city: params[:user][:city]).page params[:page]
      # if we want to not display current_user's seller_page
      # .and(SellerPage.where.not user_id: current_user.id)
    end
  end

  def show
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
      AuthyRegistration.new(current_user.id, params[:seller_page][:phone_number])
      AuthyRequest.new(current_user.seller_page.authy_id)
      redirect_to seller_page_otp_verification_path(current_user.seller_page.id), notice: "Please verify your account by entering the One-Time Password sent to your mobile number."
    else
      flash[:alert] = "Invalid OTP"
      render action: 'new'
    end
  end

  # PATCH/PUT /seller_pages/:id
  def update
    if @seller_page.update(seller_page_params)
      if @seller_page.saved_change_to_attribute?("phone_number")
        AuthyRemoveUser.new(current_user.id)
        AuthyRegistration.new(current_user.id, params[:seller_page][:phone_number])
        @seller_page.update(verified: false)
        if @seller_page.verified == false
          AuthyRequest.new(current_user.seller_page.authy_id)
        end
        redirect_to seller_page_otp_verification_path(current_user.seller_page.id), notice: "Please verify your account by entering the One-Time Password sent to your mobile number."
      else
        redirect_to seller_page_path(@seller_page), notice: "Seller page was successfully updated."
      end
    else
      render action: 'edit'
    end
  end

  # DELETE /seller_pages/:id
  def destroy
    @seller_page.destroy
    redirect_to root_path, notice: "Seller page was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller_page
      @seller_page = SellerPage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def seller_page_params
      params.require(:seller_page).permit(:business_name, :business_info, :verified, :phone_number, :region, :city, :user_id)    
    end
end
