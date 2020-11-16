class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]

  # GET /trades
  # GET /trades.json
  def index
    @current_user_collection_items = current_user.collection_items.inject([]) do |acc, owned_item|
      acc << { game: owned_item, user: current_user.id } 
    end

    @other_user_wishlist_items = User.other_users(current_user).map do |user|
      user.wishlist_items.inject([]) {|acc, wished_item| acc << { game: wished_item, user: user.id } }
    end

    @current_game_trade = []

    @current_user_collection_items.each do |collection_item|
      @other_user_wishlist_items[0].each do |wishlist_item|
        if collection_item[:game] == wishlist_item[:game]
          @current_game_trade << {
            collection_game_id: collection_item[:game][:id], 
            trader_id: collection_item[:user],
            wishlister_id: wishlist_item[:user]
          }
        end
      end
    end

    @trades = @current_game_trade
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
      params.fetch(:trade, {})
    end
end
