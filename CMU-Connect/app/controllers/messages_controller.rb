class MessagesController < ApplicationController
  def index
    @messages = Array.new
  end

  def create
    @message = Message.create!(params[:message])
  end

end
