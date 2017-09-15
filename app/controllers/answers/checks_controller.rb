class Answers::ChecksController < ApplicationController
  def create
    @exercise = Exercise.find(params[:exercise_id])
    begin
      answer = @exercise.check?(params[:answer])
    rescue => e
      logger.fatal e
      return redirect_to answers_wrong_path(@exercise, answer: 'SQLが生成できませんでした。。')
    end
    if answer == true
      redirect_to answers_correct_path(@exercise)
    else
      redirect_to answers_wrong_path(@exercise, answer: answer)
    end
  end
end
