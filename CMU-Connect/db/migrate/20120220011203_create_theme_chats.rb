class CreateThemeChats < ActiveRecord::Migration
  def self.up
    create_table :theme_chats do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :sessionId
      t.timestamps
    end
  end

  def self.down
    drop_table :theme_chats
  end
end
