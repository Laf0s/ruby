class CreateAnimals < ActiveRecord::Migration[8.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.integer :age
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
