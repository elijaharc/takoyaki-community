# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:edit_profile]

  def index
    @q = SellerPage.ransack(params[:q])
    @seller_pages = @q.result(distinct: true)
  end

  def edit_profile
  end
end
