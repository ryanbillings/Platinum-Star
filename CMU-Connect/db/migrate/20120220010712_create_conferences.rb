class CreateConferences < ActiveRecord::Migration
  def self.up
    create_table :conferences do |t|
      t.datetime :date
      t.boolean :public
      t.string :sessionId
      t.string :name
      t.text :description
      t.integer :host_id
      t.timestamps
    end
  end

  def self.down
    drop_table :conferences
  end
end
