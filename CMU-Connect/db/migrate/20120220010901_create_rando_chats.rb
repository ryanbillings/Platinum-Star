class CreateRandoChats < ActiveRecord::Migration
  def change
    create_table :rando_chats do |t|
      t.string :sessionId

      t.timestamps
    end
  end
end
