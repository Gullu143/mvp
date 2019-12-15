class AddSellerToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :seller, foreign_key: true
  end
end
