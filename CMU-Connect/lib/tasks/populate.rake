require 'rake'

namespace :populate do
  task :pop => :environment do

  user = User.new
  user.username = "Joe"
  user.andrew = "Shmoe"
  user.password = "password"
  user.email = "fffffffff@example.com"
  user.save!

  end
end
