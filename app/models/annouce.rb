class Annouce < ApplicationRecord
  belongs_to :user
 has_many :photos, dependent: :destroy
 has_many :reviews, dependent: :destroy

 validates :title, presence: true

 validates :price, numericality: { only_integer: true, greater_than: 5 }

 validates :address, presence: true

 validates :description, presence: true, length: {maximum: 600}

 validates :categorie, presence: true

 def average_rating

         reviews.count == 0 ? 0 : reviews.average(:star).round(2)

  end
end
