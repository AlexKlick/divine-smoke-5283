class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.text :description
      t.integer :days_til_harvest
    end
  end
end
