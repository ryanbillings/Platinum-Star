class ThemeChatsController < ApplicationController
  before_filter :login_required
 load_and_authorize_resource

  def index
    @theme_chats = ThemeChat.all
  end

  def show
    @theme_chat = ThemeChat.find(params[:id])
  end

  def new
    @theme_chat = ThemeChat.new
  end

  def create
    @theme_chat = ThemeChat.new(params[:theme_chat])
    config_opentok
    session = @opentok.create_session(request.remote_addr)
    @theme_chat.sessionId = session.session_id
    if @theme_chat.save
      redirect_to @theme_chat, :notice => "Successfully created theme chat."
    else
      render :action => 'new'
    end
  end

  def edit
    @theme_chat = ThemeChat.find(params[:id])
  end

  def update
    @theme_chat = ThemeChat.find(params[:id])
    if @theme_chat.update_attributes(params[:theme_chat])
      redirect_to @theme_chat, :notice  => "Successfully updated theme chat."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @theme_chat = ThemeChat.find(params[:id])
    @theme_chat.destroy
    redirect_to theme_chats_url, :notice => "Successfully destroyed theme chat."
  end
 
  def video
    @theme_chat = ThemeChat.find(params[:id])
    config_opentok
    @tok_token = @opentok.generate_token :session_id => @theme_chat.sessionId
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
