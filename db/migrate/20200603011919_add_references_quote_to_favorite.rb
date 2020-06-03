class AddReferencesQuoteToFavorite < ActiveRecord::Migration[6.0]
  def change
    add_reference :quotes, :favorite_vendor, foreign_key: true
  end
end
