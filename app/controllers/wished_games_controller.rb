class WishedGamesController < ApplicationController
  before_action :set_wished_game, only: [:show, :edit, :update, :destroy]
  
  # GET /wished_games
  # GET /wished_games.json
  def index
    @wished_games = current_user.wishlist_items
  end

  # GET /wished_games/1
  # GET /wished_games/1.json
  def show
  end

  # GET /wished_games/new
  def new
    @wished_game = WishedGame.new
  end

  # GET /wished_games/1/edit
  def edit
  end

  # POST /wished_games
  # POST /wished_games.json
  def create
    selected_board_game = BoardGame.find(params[:id])
    current_user.wishlist_items << selected_board_game

    puts current_user.wishlist_item_ids

    redirect_to wished_games_path

  #   respond_to do |format|
  #     if @wished_game.save
  #       format.html { redirect_to @wished_game, notice: 'Wished game was successfully created.' }
  #       format.json { render :show, status: :created, location: @wished_game }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @wished_game.errors, status: :unprocessable_entity }
  #     end
  #   end
  end

  # PATCH/PUT /wished_games/1
  # PATCH/PUT /wished_games/1.json
  def update
    respond_to do |format|
      if @wished_game.update(wished_game_params)
        format.html { redirect_to @wished_game, notice: 'Wished game was successfully updated.' }
        format.json { render :show, status: :ok, location: @wished_game }
      else
        format.html { render :edit }
        format.json { render json: @wished_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wished_games/1
  # DELETE /wished_games/1.json
  def destroy
    @wished_game.destroy
    respond_to do |format|
      format.html { redirect_to wished_games_url, notice: 'Wished game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wished_game
      @wished_game = WishedGame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wished_game_params
      params.permit(:wishlister_id, :board_game_id)
    end
end
