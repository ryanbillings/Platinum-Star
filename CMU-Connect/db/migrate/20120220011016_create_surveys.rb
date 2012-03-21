class CreateSurveys < ActiveRecord::Migration
  def self.up
    create_table :surveys do |t|
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end

  def self.down
    drop_table :surveys
  end
end
