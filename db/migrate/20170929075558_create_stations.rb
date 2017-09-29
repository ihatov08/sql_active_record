class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :city
      t.string :state
      t.integer :lan_n
      t.integer :lan_w

      t.timestamps
    end
  end
end
