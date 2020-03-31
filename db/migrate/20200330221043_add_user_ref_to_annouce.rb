class AddUserRefToAnnouce < ActiveRecord::Migration[5.1]
  def change
    add_reference :annouces, :user, foreign_key: true
  end
end
