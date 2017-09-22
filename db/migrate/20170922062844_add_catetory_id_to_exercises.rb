class AddCatetoryIdToExercises < ActiveRecord::Migration[5.1]
  def change
    add_reference :exercises, :category, foreign_key: true
  end
end
