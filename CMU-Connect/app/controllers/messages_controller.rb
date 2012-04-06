class MessagesController < ApplicationController
  before_filter :login_required 
  def index
    @messages = Array.new
    @survey = Survey.where("start_date <= ? AND end_date >= ?",Time.now,Time.now).first
    if @survey
     @topics = @survey.topics
     @vote = SurveyUser.where("user_id = ? AND survey_id = ?",current_user.id,@survey.id).first
    end
    @theme_chat = ThemeChat.where("start_date <= ? AND end_date >= ?",Time.now,Time.now).first
  end

  def create
    @message = Message.create!(params[:message])
  end
  
  def professional
    @messages = Array.new
  end

end
