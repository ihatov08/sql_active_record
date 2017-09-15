class Answers::ChecksController < ApplicationController
  def create
    @exercise = Exercise.find(params[:exercise_id])
    begin
      answer = @exercise.check?(params[:answer])
    # syntax errorも捕捉したいのでExceptionクラスを指定
    rescue => e
      return redirect_to answers_wrong_path(@exercise, answer: e)
      logger.fatal e
    rescue Exception => e
      logger.fatal e
      return redirect_to answers_wrong_path(@exercise, answer: e)
    end
    if answer == true
      redirect_to answers_correct_path(@exercise)
    else
      redirect_to answers_wrong_path(@exercise, answer: answer)
    end
  end
end
