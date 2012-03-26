class UserConf < ActiveRecord::Base
  attr_accessible :user_id, :conference_id, :andrew

  belongs_to :user
  belongs_to :conference

  def user_name=(name)
    user = User.find_by_andrew(name)
    if user
      self.user_id = user.id
    else
      errors[:user_name] << "Invalid name entered"
    end
  end
  def user_name
    User.find(user_id).andrew if user_id
  end
end
