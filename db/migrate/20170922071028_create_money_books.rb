class CreateMoneyBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :money_books do |t|
      t.string :item, null: false
      t.string :memo
      t.integer :recieve, default: 0, null: false
      t.integer :pay, default: 0, null: false

      t.timestamps
    end
  end
end
