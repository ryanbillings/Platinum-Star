class Complaint < ActiveRecord::Base
<<<<<<< HEAD

belongs_to :user


=======
  attr_accessible :to_user, :from_user, :description, :rando_chat_id
  belongs_to :rando_chat
>>>>>>> 1cb1b35a0d4ca1706ab7e5b9eba534e5551e5d05
end
