class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|

      t.timestamps
    end
  end
end
