class Answers::ChecksController < ApplicationController
  def create
    begin
      sql = Exercise.find_by_sql(Exercise.find(params[:exercise_id]).title)
      ar_sql = eval(params[:answer])

      if ar_sql.respond_to?(:to_a)
        ar_sql = ar_sql.to_a
      else
        ar_sql = [ar_sql]
      end
      bool = (sql == ar_sql)
    rescue => e
      logger.fatal e
      return redirect_to answers_wrong_path(params[:exercise_id])
    end
    if bool
      redirect_to answers_correct_path(params[:exercise_id])
    else
      redirect_to answers_wrong_path(params[:exercise_id])
    end
  end
end
