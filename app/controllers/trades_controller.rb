class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]

  # GET /trades
  # GET /trades.json
  def index
    # FIRST TRADE MATCHES
    # Store all owned games for current user
    @current_user_collection_items = current_user.collection_items.inject([]) do |acc, owned_item|
      acc << { game: owned_item, user: current_user } 
    end

    # Store all wished games for all other users (other users: all users excluding current user)
    @other_user_wishlist_items = User.other_users(current_user).map do |user|
      user.wishlist_items.inject([]) do |acc, wished_item| 
        acc << { game: wished_item, user: user }
      end
    end

    # current user trade matches for each owned game
    @current_game_trades = []

    # compare current user owned games against all other users' wished games
    @current_user_collection_items.each do |collection_item|
      @other_user_wishlist_items.each do |user|
        user.each do |wishlist_item|
          if collection_item[:game] == wishlist_item[:game]
            @current_game_trades << {
              collection_game_id: collection_item[:game][:id],
              collection_game_name: collection_item[:game][:name],
              collection_game_image: collection_item[:game][:image], 
              trader_id: collection_item[:user][:id],
              trader_email: collection_item[:user][:email],
              wishlister_id: wishlist_item[:user][:id],
              wishlister_email: wishlist_item[:user][:email]
            }
          end
        end
      end
    end

    # SECOND TRADE MATCHES

    # Store users for all other users that appear in FIRST TRADE MATCHES
    @other_trade_users = @current_game_trades.inject([]) do |acc, trade_match|
      acc << User.find(trade_match[:wishlister_id])
    end

    # Store all owned games for other users that appear in FIRST TRADE MATCHES
    @other_user_collection_items = @other_trade_users.map do |user|
      user.collection_items.inject([]) do |acc, owned_item|
        acc << { game: owned_item, user: user }
      end
    end

    # Store all wished games for current user
    @current_user_wishlist_items = current_user.wishlist_items.inject([]) do |acc, wished_item|
      acc << { game: wished_item, user: current_user } 
    end

    # current user trade matches for each wished game
    @other_game_trades = []

    # compare other user owned games against current user wished games
    @current_user_wishlist_items.each do |wishlist_item|
      @other_user_collection_items.each do |user|
        user.each do |collection_item|
          if collection_item[:game] == wishlist_item[:game]
            @other_game_trades << {
              wishlist_game_id: wishlist_item[:game][:id],
              wishlist_game_name: wishlist_item[:game][:name],
              wishlist_game_image: wishlist_item[:game][:image], 
              trader_id: collection_item[:user][:id],
              trader_email: collection_item[:user][:email],
              wishlister_id: wishlist_item[:user][:id],
              wishlister_email: wishlist_item[:user][:email]
            }
          end
        end
      end
    end

    # Store all matches
    @trade_matches = @current_game_trades + @other_game_trades

    # Store all trades (bi-directional matches)
    @trades = []

    @current_game_trades.each do |current_trade|
      @other_game_trades.each do |other_trade|
        if current_trade[:trader_id] == other_trade[:wishlister_id] && current_trade[:wishlister_id] == other_trade[:trader_id]
          @trades << {
            current_trade: current_trade,
            other_trade: other_trade
          }
        end
      end
    end

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
