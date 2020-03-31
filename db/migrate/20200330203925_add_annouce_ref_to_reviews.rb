class AddAnnouceRefToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :annouce, foreign_key: true
  end
end
