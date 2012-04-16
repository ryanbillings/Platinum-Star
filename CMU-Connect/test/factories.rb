# FACTORIES FOR CMU Connect

# Begin with the User class
  Factory.define :user do |u|
    # if we create multiple users, automatically add a incremented number
    # by using the sequence method since login must be unique
    u.sequence(:login) { |n| "fred_#{n}" }   
    # specify a default (and awesome) password
    u.password "fred_lives"  
    # copy the password (default or otherwise) for confirmation
    u.password_confirmation { |u| u.password }  
    # as above, automatically add a incremented number to email prefix
    u.sequence(:email) { |n| "fred#{n}@example.com" }
  end

# Create factory for Conference class
  Factory.define :conference do |c|
    # your code here
	c.name "CMU PARTY"
	c.description "The biggest CMU party"
	c.active true


  end

# Create factory for complaint class
  Factory.define :complaint do |t|
    # your code here
    t.description "He was so freaky"

  end

# Finally make a factory for Chore class
  Factory.define :survey do |s|
  
    s.start_date 1.days.from_now
    # make the survey due 5 days into the future
    s.end_date 5.days.from_now
    
  end
