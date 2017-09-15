class Answers::WrongsController < ApplicationController
  def show
    @exercise = Exercise.find(params[:id])
  end
end
