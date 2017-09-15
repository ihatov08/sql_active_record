class Answers::CorrectsController < ApplicationController
  def show
    @exercise = Exercise.find(params[:id])
  end
end
