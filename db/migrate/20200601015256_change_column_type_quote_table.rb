class ChangeColumnTypeQuoteTable < ActiveRecord::Migration[6.0]
  def change
    change_column :quotes, :booked, 'integer USING CAST(booked AS integer)'
  end
end
