require 'rake'

namespace :populate do
  task :pop => :environment do
   
   require 'populator'
   require 'faker'
	
  	


  user = User.new
  user.username = "Joe"
  user.andrew = "Shmoe"
  user.password = "password"
  user.email = "fffffffff@example.com"
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
 survey.end_date= "2012-04-15"
 survey.save!
 
 topic= Topic.new
 topic.name= "Presidential Debate!"
 topic.count = 4
 topic.survey_id=survey.id
 topic.save!
 
 survey= Survey.new
 survey.start_date= "2012-04-09"
 survey.end_date= "2012-04-17"
 survey.save!
 
 topic= Topic.new
 topic.name= "Chitchat"
 topic.count = 3
 topic.survey_id=survey.id
 topic.save!
 
 survey= Survey.new
 survey.start_date= "2012-04-09"
 survey.end_date= "2012-04-15"
 survey.save!
 
 topic= Topic.new
 topic.name= "StarCraft night"
 topic.count = 66
 topic.survey_id=survey.id
 topic.save!
 
 survey= Survey.new
 survey.start_date= "2012-04-09"
 survey.end_date= "2012-04-16"
 survey.save!
 
 topic= Topic.new
 topic.name= "LOL"
 topic.count = 14
 topic.survey_id=survey.id
 topic.save!
 
 

 conference= Conference.new
 conference.start_time= "2012-04-09 08:56" 
 conference.end_time= "2012-04-12 10:56" 
 conference.name = "idk"
 conference.description= "hi"
 conference.public = 1
 conference.professional = 1
 conference.host_id=user.id
 conference.save!
 
 
 
 
 
 
 
  end
end
