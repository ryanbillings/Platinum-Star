class InvitationsController < ApplicationController
  def invite
    @user_conf = UserConf.new
    @conference = Conference.find_by_id(params[:id])
    @error_messages = Array.new
    if @conference == nil or @conference.host_id != current_user.id
      flash[:error] = "Unauthroized Access"
      redirect_to :root
      return
    end
  end

  def create
    @user_conf = UserConf.new
    @error_messages = Array.new
    user = User.find_by_andrew(params[:andrew])
    conference = Conference.find_by_id(params[:id])
  
    if user == nil or conference == nil
      @error_messages.push("Invalid User or Conference")
      render :action => 'invite'
      return
    end

    @user_confs = UserConf.all
    @user_confs.each do |uc|
      if uc.user_id == user.id and uc.conference_id == conference.id
        @error_messages.push("That user has already been invited to this conference")
        render :action => 'invite'
        return
      end
    end

    @user_conf.conference_id = conference.id
    @user_conf.andrew = user.andrew
    @user_conf.user_id = user.id
    @user_conf.confirmed = false
    UserMailer.invitation(user,conference).deliver
    if user.receive_text == true
       UserMailer.text_alert(user,conference).deliver
    end

    if @user_conf.save
      redirect_to conference, :notice => "Successfully sent Invitation"
    else
      render :action => 'invite'
    end
   end

   def autocomplete
     if params[:term]
     @invitations = User.where("andrew LIKE ?","%#{params[:term]}%")
     @users_hash = Array.new
     @invitations.each do |invitation|
       @users_hash.push(invitation.andrew)
     end
     else
     @users_hash = Array.new
     end
     respond_to do |format|
       format.json { render :json => @users_hash }
     end
   end

  # Confirm an invitation
  def confirm
    user_conf = UserConf.find_by_id(params[:id])
    # If the user messes with the url, send them back
    if user_conf.user_id != current_user.id
      redirect_to conferences_url, :notice => "You do not have a pending invite to that conference"
      return
    end
    # Otherwise confirm the meeting
    user_conf.update_attribute(:confirmed, true)
    redirect_to calendar_url, :notice => "Successfully Confirmed Invitation"
  end


end
