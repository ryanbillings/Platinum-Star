class Complaint < ActiveRecord::Base
<<<<<<< HEAD

belongs_to :user


=======
  attr_accessible :to_user, :from_user, :description, :rando_chat_id
  belongs_to :rando_chat
<<<<<<< HEAD
>>>>>>> 1cb1b35a0d4ca1706ab7e5b9eba534e5551e5d05
=======
  before_save :ban_user

  def ban_user
    @complaints = Complaint.where(:to_user => self.to_user).all
    if @complaints.size > 2
      @user = User.find_by_andrew(self.to_user)
      @user.update_attribute(:role,"banned")
    end
   end


>>>>>>> a5d9e0429f85b4ddb8f9eeb223ded560090cccab
end
