class ReviewsController < ApplicationController
  before_action :set_seller_page
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /seller_page/:id/reviews
  def index
    @reviews = @seller_page.reviews.page params[:page]
  end

  # GET /seller_page/:id/reviews/1
  def show
  end

  # GET /seller_page/:id/reviews/new
  def new
    @review = @seller_page.reviews.build
  end

  # GET /seller_page/:id/reviews/1/edit
  def edit
  end

  # POST /seller_page/:id/reviews
  def create
    #Double prevention so that owner of seller page can't write own reviews
    if @seller_page.user_id != current_user.id
      @review = @seller_page.reviews.build(review_params)
      @review.user_id = current_user.id
      @review.reviewer_first_name = current_user.first_name
      @review.reviewer_last_name = current_user.last_name
      if @review.save
        redirect_to seller_page_reviews_path, notice: "Review was successfully created."
      else
        render action: 'new'
      end
    end
  end

  # PATCH/PUT /seller_page/:id/reviews/1
  def update
    if @review.update(review_params)
      redirect_to seller_page_review_path, notice: "Review was successfully updated."
    else
      render action: 'edit'
    end
  end

  # DELETE /seller_page/:id/reviews/1
  def destroy
    @review.destroy
    redirect_to seller_page_reviews_path, notice: "Review was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller_page
      @seller_page = SellerPage.friendly.find(params[:seller_page_id])
    end
    
    def set_review
      @review = @seller_page.reviews.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:comment, :rating, :seller_page_id, :user_id, :reviewer_first_name, :reviewer_last_name)
    end
end
