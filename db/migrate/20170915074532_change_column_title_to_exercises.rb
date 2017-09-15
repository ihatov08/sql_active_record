class ChangeColumnTitleToExercises < ActiveRecord::Migration[5.1]
  def change
    change_column :exercises, :title, :text
  end
end
