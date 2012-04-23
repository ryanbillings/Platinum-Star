class Complaint < ActiveRecord::Base

<<<<<<< HEAD
belongs_to :user


  attr_accessible :to_user, :from_user, :description, :rando_chat_id
  belongs_to :rando_chat

=======
  attr_accessible :to_user, :from_user, :description, :rando_chat_id
  belongs_to :rando_chat
>>>>>>> 9e3c735654134c47412fff73092ca3cc72d1786f
  before_save :ban_user

  def ban_user
    @complaints = Complaint.where(:to_user => self.to_user).all
    if @complaints.size > 2
      @user = User.find_by_andrew(self.to_user)
      @user.update_attribute(:role,"banned")
    end
   end


end
