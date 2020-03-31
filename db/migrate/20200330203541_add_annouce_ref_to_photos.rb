class AddAnnouceRefToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_reference :photos, :annouce, foreign_key: true
  end
end
