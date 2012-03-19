class CreateUserConfs < ActiveRecord::Migration
  def change
    create_table :user_confs do |t|
      t.integer :user_id
      t.integer :conference_id
      t.string :andrew
      t.timestamps
    end
  end
end
