# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:edit_profile]

  def index; end

  def edit_profile
  end
end
