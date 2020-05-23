class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.datetime :data
      t.string :esecuzione
      t.string :symbol
      t.string :sentiment
      t.string :macropattern
      t.string :zona_critica
      t.float :angolo_trendline
      t.string :nome_micro
      t.string :note_micro
      t.string :note_macro
      t.datetime :data_micro
      t.string :configurazione_pivot
      t.string :configurazione_daily
      t.string :pivot_giornalieri 
      t.string :distanza_pivot
      t.string :rating
      t.boolean :buy
      t.string :timeframe
      t.float :prezzo_entrata
      t.float :prezzo_sl
      t.float :lotti
      t.float :tp1
      t.float :tp2
      t.string :risultato
      t.string :ragioni_uscita
      t.string :note
      t.decimal :confidenza

      t.timestamps
    end
  end
end
