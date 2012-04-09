require 'rake'

namespace :populate do
  task :pop => :environment do
<<<<<<< HEAD
   
   require 'populator'
   require 'faker'
	
  	

  
	
=======

>>>>>>> dc7e9512e6dfe7d78bcc872d3276a61258262f28
  user = User.new
  user.username = "Joe"
  user.andrew = "Shmoe"
  user.password = "password"
  user.email = "fffffffff@example.com"
<<<<<<< HEAD
  user.role = "default"
  user.save!

  
  user = User.new
  user.username = "Ellis"
  user.andrew = "ellisk"
  user.password = "password"
  user.email = "Alicd@example.com"
  user.role = "admin"
  user.save!
  
  user = User.new
  user.username = "Charles"
  user.andrew = "cleung1"
  user.password = "password"
  user.email = "Alicg@example.com"
  user.role = "admin"
  user.save!
  

  user = User.new
  user.username = "Hiro"
  user.andrew = "hnakagaw"
  user.password = "password"
  user.email = "Alwece@example.com"
  user.role = "admin"
  user.save!
  
  user = User.new
  user.username = "Jennifer"
  user.andrew = "hlee1"
  user.password = "password"
  user.email = "fffweerwfffff@example.com"
  user.role = "default"
  user.save!

  user = User.new
  user.username = "Jgoe"
  user.andrew = "Shmoe"
  user.password = "password"
  user.email = "ffffwerwerdfff@example.com"
  user.role = "default"
  user.save!

  user = User.new
  user.username = "Yeji"
  user.andrew = "yejik"
  user.password = "password"
  user.email = "fffgg@example.com"
  user.save!


   user = User.new
  user.username = "Hyein"
  user.andrew = "hyeink"
  user.password = "password"
  user.email = "fffggggffff@example.com"
  user.save!
  
   user = User.new
  user.username = "Eddie"
  user.andrew = "ejbai"
  user.password = "password"
  user.email = "fggggff@example.com"
  user.save!
  
   user = User.new
  user.username = "Yang"
  user.andrew = "yangyou"
  user.password = "password"
  user.email = "fasdfffff@example.com"
  user.save!
  
 
 survey= Survey.new
 survey.start_date= "2012-04-09"
 survey.end_date= "2012-04-12"
 survey.save!
 
 
  
  
  
  
  
  
  end
end
=======
  user.save!

  end
end
>>>>>>> dc7e9512e6dfe7d78bcc872d3276a61258262f28
