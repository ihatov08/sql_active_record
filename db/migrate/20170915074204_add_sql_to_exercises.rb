class AddSqlToExercises < ActiveRecord::Migration[5.1]
  def change
    add_column :exercises, :sql, :text
  end
end
