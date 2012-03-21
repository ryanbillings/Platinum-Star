class CreateRandoChats < ActiveRecord::Migration
  def change
    create_table :rando_chats do |t|
      t.string :sessionId
      t.integer :u1_id
      t.integer :u2_id
      t.timestamps
    end
  end
end
