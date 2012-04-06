class TopicsController < ApplicationController
before_filter :login_required
  def vote
    topic_id = params[:topic]
    survey_id = params[:survey]
    @topic = Topic.find_by_id(topic_id)
    @vote = SurveyUser.where("user_id = ? AND survey_id = ?",current_user.id,survey_id).first
    if @vote
      redirect_to messages_path, :notice => "You have already voted!"
      return
    else
      new_vote = SurveyUser.new
      new_vote.user_id = current_user.id
      new_vote.survey_id = survey_id
      new_vote.save!
      @topic.update_attribute(:count, @topic.count + 1)
      redirect_to messages_path, :notice => "Thank You for Voting!"
     end
  end
end
