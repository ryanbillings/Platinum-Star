class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.integer :rando_chat_id
      t.boolean :match

      t.timestamps
    end
  end
end
