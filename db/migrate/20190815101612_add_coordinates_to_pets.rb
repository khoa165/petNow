class AddCoordinatesToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :latitude, :float
    add_column :pets, :longitude, :float
  end
end
