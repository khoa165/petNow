class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :category
      t.references :user
      t.string :species
      t.integer :avaerage_rating
      t.integer :age
      t.integer :price_per_day
      t.string :photo
      t.string :address

      t.timestamps
    end
  end
end
