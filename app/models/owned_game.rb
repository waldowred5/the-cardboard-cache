class OwnedGame < ApplicationRecord
    belongs_to :user
    belongs_to :board_game

    enum trade_status: [:Tradeable, :'Not For Trade']
    enum condition: [:'Brand New', :'Like New', :Used]

    # scope :name, -> { keyword(attribute: :value) }
    # scope :current_collection, -> { where(current_user.owned_games)}
end
