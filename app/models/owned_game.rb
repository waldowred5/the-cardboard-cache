class OwnedGame < ApplicationRecord
    belongs_to :user
    belongs_to :board_game

    enum trade_status: [:Tradeable, :'Not For Trade']
    enum condition: [:'Brand New', :'Like New', :Used]
end
