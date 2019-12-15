class AddBuyerToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :buyer, foreign_key: true
  end
end
