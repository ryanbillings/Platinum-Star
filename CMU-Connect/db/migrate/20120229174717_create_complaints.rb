class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.text :description
      t.integer :rando_chat_id
      t.string :to_user
      t.string :from_user
      t.timestamps
    end
  end
end
