class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]

  # GET /trades
  # GET /trades.json
  def index
    @trades = Trade.all
  end

  def filtro
    # Initialize filterrific with the following params:
    # * `Student` is the ActiveRecord based model class.
    # * `params[:filterrific]` are any params submitted via web request.
    #   If they are blank, filterrific will try params persisted in the session
    #   next. If those are blank, too, filterrific will use the model's default
    #   filter settings.
    # * Options:
    #     * select_options: You can store any options for `<select>` inputs in
    #       the filterrific form here. In this example, the `#options_for_...`
    #       methods return arrays that can be passed as options to `f.select`
    #       These methods are defined in the model.
    #     * persistence_id: optional, defaults to "<controller>#<action>" string
    #       to isolate session persistence of multiple filterrific instances.
    #       Override this to share session persisted filter params between
    #       multiple filterrific instances. Set to `false` to disable session
    #       persistence.
    #     * default_filter_params: optional, to override model defaults
    #     * available_filters: optional, to further restrict which filters are
    #       in this filterrific instance.
    #     * sanitize_params: optional, defaults to `true`. If true, all filterrific
    #       params will be sanitized to prevent reflected XSS attacks.
    # This method also persists the params in the session and handles resetting
    # the filterrific params.
    # In order for reset_filterrific to work, it's important that you add the
    # `or return` bit after the call to `initialize_filterrific`. Otherwise the
    # redirect will not work.
    @filterrific = initialize_filterrific(
      Trade,
      params[:filterrific],
      select_options: {
        sorted_by: Trade.options_for_sorted_by,
        with_country_id: Trade.options_for_select,
      },
      persistence_id: "shared_key",
      default_filter_params: {},
      available_filters: [:sorted_by],
      sanitize_params: true,
    ) || return
    # Get an ActiveRecord::Relation for all students that match the filter settings.
    # You can paginate with will_paginate or kaminari.
    # NOTE: filterrific_find returns an ActiveRecord Relation that can be
    # chained with other scopes to further narrow down the scope of the list,
    # e.g., to apply permissions or to hard coded exclude certain types of records.
    @trades = @filterrific.find.page(params[:page])

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
        format.html { redirect_to @trade, notice: 'Trade was successfully updated.' }
        format.json { render :show, status: :ok, location: @trade }
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
