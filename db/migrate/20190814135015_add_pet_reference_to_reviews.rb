class AddPetReferenceToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :pet, index: true
  end
end
