class AddQuoteSessionToQuotesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :checkout_session_id, :string, default: ""
  end
end
