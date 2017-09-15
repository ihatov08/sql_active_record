class AddActiveRecordQueryToExercises < ActiveRecord::Migration[5.1]
  def change
    add_column :exercises, :active_record_query, :text
  end
end
