class Answers::ChecksController < ApplicationController
  def create
    begin
      sql = Exercise.find_by_sql(Exercise.find(params[:exercise_id]).title)
      ar_sql = eval(params[:answer])
      unless ar_sql.class == Array
        ar_sql = [ar_sql]
      end
      bool = (sql == ar_sql)
    rescue => e
      redirect_to answers_wrong_path(params[:exercise_id])
      logger.fatal e
    end
    if bool
      redirect_to answers_correct_path(params[:exercise_id])
    else
      redirect_to answers_wrong_path(params[:exercise_id])
    end
  end
end
