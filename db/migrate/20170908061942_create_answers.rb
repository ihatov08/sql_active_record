class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :exercise, foreign_key: true, null: false
      t.text :body, null: false
      t.integer :kind, null: false, default: 0

      t.timestamps
    end
  end
end
