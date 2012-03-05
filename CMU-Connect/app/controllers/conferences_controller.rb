class ConferencesController < ApplicationController
  def index
    @conferences = Conference.all
  end

  def show
    @conference = Conference.find(params[:id])
  end

  def new
    @conference = Conference.new
  end

  def create
    @conference = Conference.new(params[:conference])
    @conference.host_id = current_user.id
    config_opentok
    session = @opentok.create_session(request.remote_addr)
    @conference.sessionId = session.session_id
    if @conference.save
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

  private
  def config_opentok
    if @opentok.nil?
      @api_key = 11368202
      @api_secret = "ccdd067fdd6e50a923448cdd2a7bb0d0828ca180"
      @opentok = OpenTok::OpenTokSDK.new  @api_key,@api_secret
    end
  end

end
