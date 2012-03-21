class RandoChatsController < ApplicationController

  def create
    if $rando_queue == 1
      $rando_queue = 0
      @rando_chat = RandoChat.find(:all, :order => "created_at DESC").first
      @rando_chat.update_attribute(:u2_id,current_user.id)
        respond_to do |format|
          format.html { redirect_to @rando_chat, notice: 'Please wait for other chatter' }
        end
    else
    config_opentok
    session = @opentok.create_session(request.remote_addr,Hash.new("p2p.preferences"=>"enabled"))
    @rando_chat = RandoChat.new(:sessionId => session.session_id)
    @rando_chat.u1_id = current_user.id
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
    @complaint = Complaint.new
    @rando_chat = RandoChat.find(params[:id])
    config_opentok
    @tok_token = @opentok.generate_token :session_id => @rando_chat.sessionId
    respond_to do |format|
      format.html 
    end
   end

   def exchange
     # If there is no exchange row yet, create it
     @rando_chat = RandoChat.find(params[:id])
     if @rando_chat.exchange.nil?
       @exchange = Exchange.new(:rando_chat_id => @rando_chat.id)
       @exchange.match = params[:match]
       @exchange.save
     else
       @exchange = @rando_chat.exchange
       if @exchange.match == true and params[:match] == "true"
       #MAILER
       
       end
     end
    if params[:next] == "true"
      redirect_to :action => "create"
    else
      redirect_to "/messages/"
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

