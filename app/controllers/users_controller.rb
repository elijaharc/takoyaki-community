class UsersController < ApplicationController
  before_action :set_user, only: %i[ update ]

  # PATCH/PUT
  def update
      if @current_user.update(user_params)
        redirect_to root_path
        #add notice
      else
        redirect_back(fallback_location: root_path)
        flash[:notice] = "OMG"
      end
  end

  private
    def set_user
      @user = current_user.id
    end
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :region, :city)
    end
end
