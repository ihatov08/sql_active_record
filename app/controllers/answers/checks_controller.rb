class Answers::ChecksController < ApplicationController
  def create
    @exercise = Exercise.find(params[:exercise_id])
    begin
      bool = @exercise.check?(params[:answer])
    rescue => e
      logger.fatal e
      return redirect_to answers_wrong_path(@exercise)
    end
    if bool
      redirect_to answers_correct_path(@exercise)
    else
      redirect_to answers_wrong_path(@exercise)
    end
  end
end
