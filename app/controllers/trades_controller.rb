class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]

  # GET /trades
  # GET /trades.json
  def index
    #@trades = Trade.all

    (@filterrific = initialize_filterrific(
      Trade,
      params[:filterrific],
      select_options: {
        sorted_by: Trade.options_for_sorted_by,
      },
      persistence_id: "shared_key",
      default_filter_params: {},
      available_filters: [:sorted_by],
      sanitize_params: true,
    )) || return
    # Get an ActiveRecord::Relation for all students that match the filter settings.
    # You can paginate with will_paginate or kaminari.
    # NOTE: filterrific_find returns an ActiveRecord Relation that can be
    # chained with other scopes to further narrow down the scope of the list,
    # e.g., to apply permissions or to hard coded exclude certain types of records.
    #@trades = @filterrific.find.page(params[:page]).per(5)
    @trades = @filterrific.find.paginate(page: params[:page], per_page:30)
    # Respond to html for initial page load and to js for AJAX filter updates.
    respond_to do |format|
      format.html
      format.js
    end

  # Recover from invalid param sets, e.g., when a filter refers to the
  # database id of a record that doesn’t exist any more.
  # In this case we reset filterrific and discard all filter params.
  rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Had to reset filterrific params: #{e.message}"
    redirect_to(reset_filterrific_url(format: :html)) && return
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
  end

  # GET /trades/new
  def new
    @trade = Trade.new
  end

  # GET /trades/1/edit
  def edit
  end

  # POST /trades
  # POST /trades.json
  def create
    @trade = Trade.new(trade_params)

    respond_to do |format|
      if @trade.save
        format.html { redirect_to @trade, notice: 'Trade was successfully created.' }
        format.json { render :show, status: :created, location: @trade }
      else
        format.html { render :new }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trades/1
  # PATCH/PUT /trades/1.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        format.html { redirect_to trades_url, notice: 'Trade was successfully updated.' }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to trades_url, notice: 'Trade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trade_params
      params.require(:trade).permit(:resa,:resa_tp2,:ostacoli_tp1, :data, :esecuzione, :symbol, :sentiment, :macropattern, :zona_critica, :angolo_trendline, :nome_micro, :note_micro, :note_macro, :data_micro, :configurazione_pivot, :configurazione_daily, :distanza_pivot, :pivot_giornalieri, :rating, :buy, :timeframe, :prezzo_entrata, :prezzo_sl, :lotti, :tp1, :tp2, :risultato, :ragioni_uscita, :note, :confidenza,:screen,:screen_sentiment_mn,:screen_sentiment_w1,:screen_sentiment_d1,:screen_sentiment_h4,:screen_sentiment_h1)
    end
end
