class HomeController < ApplicationController
  before_filter :login_required, :except => [:password_reset,:reset,:privacy, :contact, :landing]
  layout nil
  layout 'application', :except => :landing
  authorize_resource :only => [:admin,:reset_all], :class => false

  def password_reset
    user = User.find_by_andrew(params[:andrew])
    if user
      pass = User.random_password
      user.update_attribute(:password,pass)
      UserMailer.password_reset(user.email,pass).deliver
      flash[:notice] = "Successfully reset password"
      redirect_to :root
    else
      flash.now[:error] = "Invalid Andrew ID"
      redirect_to "/reset"
    end
   end

   def reset_all
     users = User.all
     for user in users
       pass = User.random_password
       user.update_attribute(:password,pass)
       UserMailer.password_reset(user.email,pass).deliver
     end
     redirect_to :root
   end
end
