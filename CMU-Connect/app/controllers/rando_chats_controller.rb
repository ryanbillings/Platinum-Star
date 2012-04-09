class RandoChatsController < ApplicationController
before_filter :login_required

    def create
     if params[:type] == "social"
      type = true
      session[:type] = "social"
     else
      type = false
      session[:type] = "professional"
     end
     # First, check for a room with one person in it
     @rando_chat = RandoChat.where("social = ? AND status = ?",type,"waiting").order("created_at desc").first
     if @rando_chat
        @rando_chat.update_attribute(:u2_id,current_user.id)
        @rando_chat.update_attribute(:status,"full")
        respond_to do |format|
          format.html { redirect_to @rando_chat, notice: 'Enjoy your Chat!' }
        end
        return
   # Otherwise create a new room
    else    
      config_opentok
      osession = @opentok.create_session(request.remote_addr,Hash.new("p2p.preferences"=>"enabled"))
      @rando_chat = RandoChat.new(:sessionId => osession.session_id)
      @rando_chat.u1_id = current_user.id
      @rando_chat.social = type
      @rando_chat.status = "waiting"
    end
    respond_to do |format|
      if @rando_chat.save
        format.html { redirect_to @rando_chat, notice: 'Please wait for the other chatter' }
      else
	format.html { render action: "messages#index" }
      end
    end
  end



  def show
    @complaint = Complaint.new
    @rando_chat = RandoChat.find(params[:id])
    if current_user.id != @rando_chat.u1_id and current_user.id != @rando_chat.u2_id
      redirect_to :root, notice: "You do not have access to that page"
      return
    end
    @type = session[:type]
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
       @rando_chat.update_attribute(:status, "finished")
     else
       @exchange = @rando_chat.exchange
       if @exchange.match == true and params[:match] == "true"
         user1 = User.find_by_id(@rando_chat.u1_id)
         user2 = User.find_by_id(@rando_chat.u2_id)
	 UserMailer.exchange(user1,user2).deliver
         UserMailer.exchange(user2,user1).deliver
       end
       @rando_chat.update_attributes(:u1_id => nil, :u2_id => nil)
     end
    if params[:next] == "true"
      redirect_to :action => "create"
    else
      redirect_to "/messages/"
    end
   end
  
  def exit_window
    @rando_chat = RandoChat.find(params[:id])
    @rando_chat.update_attribute(:status, "finished")
    redirect_to :root
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

