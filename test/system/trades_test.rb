require "application_system_test_case"

class TradesTest < ApplicationSystemTestCase
  setup do
    @trade = trades(:one)
  end

  test "visiting the index" do
    visit trades_url
    assert_selector "h1", text: "Trades"
  end

  test "creating a Trade" do
    visit trades_url
    click_on "New Trade"

    fill_in "Angolo trendline", with: @trade.angolo_trendline
    check "Buy" if @trade.buy
    fill_in "Confidenza", with: @trade.confidenza
    fill_in "Configurazione daily", with: @trade.configurazione_daily
    fill_in "Configurazione pivot", with: @trade.configurazione_pivot
    fill_in "Data", with: @trade.data
    fill_in "Data micro", with: @trade.data_micro
    fill_in "Distanza pivot", with: @trade.distanza_pivot
    fill_in "Esecuzione", with: @trade.esecuzione
    fill_in "Lotti", with: @trade.lotti
    fill_in "Macropattern", with: @trade.macropattern
    fill_in "Nome micro", with: @trade.nome_micro
    fill_in "Note", with: @trade.note
    fill_in "Note macro", with: @trade.note_macro
    fill_in "Note micro", with: @trade.note_micro
    fill_in "Prezzo entrata", with: @trade.prezzo_entrata
    fill_in "Prezzo sl", with: @trade.prezzo_sl
    fill_in "Ragioni uscita", with: @trade.ragioni_uscita
    fill_in "Rating", with: @trade.rating
    fill_in "Risultato", with: @trade.risultato
    fill_in "Sentiment", with: @trade.sentiment
    fill_in "Symbol", with: @trade.symbol
    fill_in "Timeframe", with: @trade.timeframe
    fill_in "Tp1", with: @trade.tp1
    fill_in "Tp2", with: @trade.tp2
    fill_in "Zona critica", with: @trade.zona_critica
    click_on "Create Trade"

    assert_text "Trade was successfully created"
    click_on "Back"
  end

  test "updating a Trade" do
    visit trades_url
    click_on "Edit", match: :first

    fill_in "Angolo trendline", with: @trade.angolo_trendline
    check "Buy" if @trade.buy
    fill_in "Confidenza", with: @trade.confidenza
    fill_in "Configurazione daily", with: @trade.configurazione_daily
    fill_in "Configurazione pivot", with: @trade.configurazione_pivot
    fill_in "Data", with: @trade.data
    fill_in "Data micro", with: @trade.data_micro
    fill_in "Distanza pivot", with: @trade.distanza_pivot
    fill_in "Esecuzione", with: @trade.esecuzione
    fill_in "Lotti", with: @trade.lotti
    fill_in "Macropattern", with: @trade.macropattern
    fill_in "Nome micro", with: @trade.nome_micro
    fill_in "Note", with: @trade.note
    fill_in "Note macro", with: @trade.note_macro
    fill_in "Note micro", with: @trade.note_micro
    fill_in "Prezzo entrata", with: @trade.prezzo_entrata
    fill_in "Prezzo sl", with: @trade.prezzo_sl
    fill_in "Ragioni uscita", with: @trade.ragioni_uscita
    fill_in "Rating", with: @trade.rating
    fill_in "Risultato", with: @trade.risultato
    fill_in "Sentiment", with: @trade.sentiment
    fill_in "Symbol", with: @trade.symbol
    fill_in "Timeframe", with: @trade.timeframe
    fill_in "Tp1", with: @trade.tp1
    fill_in "Tp2", with: @trade.tp2
    fill_in "Zona critica", with: @trade.zona_critica
    click_on "Update Trade"

    assert_text "Trade was successfully updated"
    click_on "Back"
  end

  test "destroying a Trade" do
    visit trades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trade was successfully destroyed"
  end
end
