class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      if $logged_in_user.include?(user.id) == false
        $logged_in_user.push(user.id)
      end
      redirect_to_target_or_default :welcome, :notice => "Logged in successfully."
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    $logged_in_user.delete(session[:user_id])
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have been logged out."
  end

  def invite_count
 
  end
end
