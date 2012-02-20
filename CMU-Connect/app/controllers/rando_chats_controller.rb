class RandoChatsController < ApplicationController

  def create
    if $rando_queue == 1
      $rando_queue = 0
      @rando_chat = RandoChat.find(:all, :order => "created_at DESC").first
      respond_to do |format|
        format.html { redirect_to @rando_chat, notice: 'Please wait for other chatter' }
      end
    else
    config_opentok
    session = @opentok.create_session request.remote_addr
    @rando_chat = RandoChat.new(:sessionId => session.session_id)
    $rando_queue = 1
    respond_to do |format|
      if @rando_chat.save
        format.html { redirect_to @rando_chat, notice: 'Start Chatting' }
      else
	format.html { render action: "messages#index" }
      end
     end
    end
  end

  

  def show
    @rando_chat = RandoChat.find(params[:id])
    config_opentok
    @tok_token = @opentok.generate_token :session_id => @rando_chat.sessionId
    respond_to do |format|
      format.html 
    end
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

