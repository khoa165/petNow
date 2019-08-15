class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.text :description
      t.string :category
      t.string :species
      t.integer :average_rating, default: 0
      t.integer :price_per_day
      t.string :photo
      t.string :address
      t.string :city
      t.string :country
      t.float :latitude
      t.float :longitude
      t.references :user

      t.timestamps
    end
  end
end
