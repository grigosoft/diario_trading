require 'test_helper'

class TradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trade = trades(:one)
  end

  test "should get index" do
    get trades_url
    assert_response :success
  end

  test "should get new" do
    get new_trade_url
    assert_response :success
  end

  test "should create trade" do
    assert_difference('Trade.count') do
      post trades_url, params: { trade: { angolo_trendline: @trade.angolo_trendline, buy: @trade.buy, confidenza: @trade.confidenza, configurazione_daily: @trade.configurazione_daily, configurazione_pivot: @trade.configurazione_pivot, data: @trade.data, data_micro: @trade.data_micro, distanza_pivot: @trade.distanza_pivot, esecuzione: @trade.esecuzione, lotti: @trade.lotti, macropattern: @trade.macropattern, nome_micro: @trade.nome_micro, note: @trade.note, note_macro: @trade.note_macro, note_micro: @trade.note_micro, prezzo_entrata: @trade.prezzo_entrata, prezzo_sl: @trade.prezzo_sl, ragioni_uscita: @trade.ragioni_uscita, rating: @trade.rating, risultato: @trade.risultato, sentiment: @trade.sentiment, symbol: @trade.symbol, timeframe: @trade.timeframe, tp1: @trade.tp1, tp2: @trade.tp2, zona_critica: @trade.zona_critica } }
    end

    assert_redirected_to trade_url(Trade.last)
  end

  test "should show trade" do
    get trade_url(@trade)
    assert_response :success
  end

  test "should get edit" do
    get edit_trade_url(@trade)
    assert_response :success
  end

  test "should update trade" do
    patch trade_url(@trade), params: { trade: { angolo_trendline: @trade.angolo_trendline, buy: @trade.buy, confidenza: @trade.confidenza, configurazione_daily: @trade.configurazione_daily, configurazione_pivot: @trade.configurazione_pivot, data: @trade.data, data_micro: @trade.data_micro, distanza_pivot: @trade.distanza_pivot, esecuzione: @trade.esecuzione, lotti: @trade.lotti, macropattern: @trade.macropattern, nome_micro: @trade.nome_micro, note: @trade.note, note_macro: @trade.note_macro, note_micro: @trade.note_micro, prezzo_entrata: @trade.prezzo_entrata, prezzo_sl: @trade.prezzo_sl, ragioni_uscita: @trade.ragioni_uscita, rating: @trade.rating, risultato: @trade.risultato, sentiment: @trade.sentiment, symbol: @trade.symbol, timeframe: @trade.timeframe, tp1: @trade.tp1, tp2: @trade.tp2, zona_critica: @trade.zona_critica } }
    assert_redirected_to trade_url(@trade)
  end

  test "should destroy trade" do
    assert_difference('Trade.count', -1) do
      delete trade_url(@trade)
    end

    assert_redirected_to trades_url
  end
end
