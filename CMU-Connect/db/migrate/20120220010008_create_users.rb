class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :andrew
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :major
      t.string :grade
      t.string :gender
      t.integer :phone
      t.string :carrier
      t.boolean :receive_text
      t.timestamps
    end
User.create :username => "JongT", :first_name => "Jonghyun", :last_name => "Thom", :password => "test", :role => "admin",:andrew=>"jthom"

	end

  
  
  def self.down
    drop_table :users
  end
end
