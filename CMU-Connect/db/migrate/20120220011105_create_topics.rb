class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :count
      t.integer :survey_id

      t.timestamps
    end
  end
end
