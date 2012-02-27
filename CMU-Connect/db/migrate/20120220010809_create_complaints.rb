class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaint do |t|
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
