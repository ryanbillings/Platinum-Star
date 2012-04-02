class ConferencesController < ApplicationController
 before_filter :login_required
  def index
    @conferences = Conference.all
  end

  def show
    @conference = Conference.find(params[:id])
    @host = User.find_by_id(@conference.host_id)
    @user_confs = @conference.user_confs.all
    @user_conf = UserConf.where(:user_id => current_user.id, :conference_id => @conference.id, :confirmed => false).first
    @users = Array.new
    @pending = Array.new

    @user_confs.each do |uc|
      user = User.find_by_id(uc.user_id)
      if uc.confirmed
        @users.push(user)
      else
        @pending.push(user)
      end
     end
  end

  def new
    @conference = Conference.new
    user_conf = @conference.user_confs.build
  end

  def create
    @conference = Conference.new(params[:conference])
    @conference.host_id = current_user.id

    @conference.user_confs.each do |uc|
      user = User.find_by_andrew(uc.andrew)
      if user == nil
        uc = nil
      elsif user.id == current_user.id
        uc.destroy
      else
        uc.user_id = user.id
	uc.confirmed = false
	#We should add a mailer here..something like
	#UserMailer.deliver(.....)
      end
    end
  
    # Professional 
    if @conference.professional
      if @conference.public
        @conference.color = "Crimson"
      else
        @conference.color = "Orange"
      end
    # Academic
    else
      if @conference.public
        @conference.color = "Blue"
      else
        @conference.color = "Yellow"
      end
    end

    host_user_conf = UserConf.new
    host_user_conf.user_id = current_user.id
    host_user_conf.andrew = current_user.andrew
    host_user_conf.confirmed = true
    config_opentok
    session = @opentok.create_session(request.remote_addr)
    @conference.sessionId = session.session_id
    if @conference.save
      host_user_conf.conference_id = @conference.id
      host_user_conf.save
      redirect_to @conference, :notice => "Successfully created conference."
    else
      render :action => 'new'
    end
  end

  def edit
    @conference = Conference.find(params[:id])
  end

  def update
    @conference = Conference.find(params[:id])
    if @conference.update_attributes(params[:conference])
      redirect_to @conference, :notice  => "Successfully updated conference."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @conference = Conference.find(params[:id])
    @conference.destroy
    redirect_to conferences_url, :notice => "Successfully destroyed conference."
  end

  def video
    @conference = Conference.find(params[:id])
    config_opentok
    @tok_token = @opentok.generate_token :session_id => @conference.sessionId
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

  private
  def config_opentok
    if @opentok.nil?
      @api_key = 11368202
      @api_secret = "ccdd067fdd6e50a923448cdd2a7bb0d0828ca180"
      @opentok = OpenTok::OpenTokSDK.new  @api_key,@api_secret
    end
  end

end
