class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.string :title,  null: false
      t.text   :body,   null: false
      t.text   :answer, null: false

      t.timestamps
    end
  end
end
