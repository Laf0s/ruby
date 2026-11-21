class PagesController < ApplicationController
  before_action :authenticate_user!, only: :profile

  def about
  end

  def profile
    @animals = current_user.animals.with_attached_image
  end
end
