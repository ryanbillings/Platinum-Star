class MessagesController < ApplicationController
  before_filter :login_required 
  def index
    @messages = Array.new
  end

  def create
    @message = Message.create!(params[:message])
  end
  
  def professional
    @messages = Array.new
  end

end
