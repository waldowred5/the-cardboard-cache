class OwnedGamesController < ApplicationController
  before_action :set_owned_game, only: [:show, :edit, :update, :destroy]

  # GET /owned_games
  # GET /owned_games.json
  def index
    @owned_games = current_user.owned_games
  end

  # GET /owned_games/1
  # GET /owned_games/1.json
  def show
  end

  # GET /owned_games/new
  def new
    @owned_game = OwnedGame.new
  end

  # GET /owned_games/1/edit
  def edit
  end

  # POST /owned_games
  # POST /owned_games.json
  def create
    selected_board_game = BoardGame.find(params[:id])
    current_user.collection_items << selected_board_game

    redirect_to owned_games_path
  end

  # PATCH/PUT /owned_games/1
  # PATCH/PUT /owned_games/1.json
  def update
    respond_to do |format|
      if @owned_game.update(owned_game_params)
        format.html { redirect_to @owned_game, notice: 'Owned game was successfully updated.' }
        format.json { render :show, status: :ok, location: @owned_game }
      else
        format.html { render :edit }
        format.json { render json: @owned_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owned_games/1
  # DELETE /owned_games/1.json
  def destroy
    @owned_game.destroy
    respond_to do |format|
      format.html { redirect_to owned_games_url, notice: 'Owned game was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owned_game
      @owned_game = OwnedGame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def owned_game_params
      params.require(:owned_game).permit(:trade_status, :condition, :price)
    end
end
