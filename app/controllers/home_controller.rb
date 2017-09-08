class HomeController < ApplicationController
  def index
    if current_user
      redirect_to exercises_path
    end
  end
end
