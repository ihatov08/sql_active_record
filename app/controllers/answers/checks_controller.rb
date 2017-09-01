class Answers::ChecksController < ApplicationController
  def create
    filename = "#{SecureRandom.hex(16)}.rb"
    File.open(filename, 'w') do |file|
      file.puts "p ar = #{params[:answer]}.to_a"
    end
    begin
      puts 'start'
      logger.info Exercise.find_by_sql('select * from exercises').to_s
      logger.info `rails runner #{filename}`.chomp
      puts 'end'
      bool = (Exercise.find_by_sql('select * from exercises').to_s == `rails runner #{filename}`.chomp)
    rescue => e
      redirect_to answers_wrong_path(params[:exercise_id])
      logger.fatal e
    ensure
      File.delete(filename)
    end
    if bool
      redirect_to answers_correct_path(params[:exercise_id])
    else
      redirect_to answers_wrong_path(params[:exercise_id])
    end
  end
end
