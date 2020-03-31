class CreateAnnouces < ActiveRecord::Migration[5.1]
  def change
    create_table :annouces do |t|
      t.string :title
      t.integer :price
      t.string :address
      t.text :description
      t.string :categorie

      t.timestamps
    end
  end
end
