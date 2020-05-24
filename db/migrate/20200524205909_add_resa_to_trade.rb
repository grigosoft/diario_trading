class AddResaToTrade < ActiveRecord::Migration[6.0]
  def change
    add_column :trades, :resa, :float
    add_column :trades, :ostacoli_tp1, :string
    add_column :trades, :resa_tp2, :string
  end
end
