class CalendarController < ApplicationController
 before_filter :login_required
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)
    conferences = Conference.where("public = ? OR id IN (SELECT conference_id FROM user_confs WHERE user_id = ?)",true,current_user.id)
    @event_strips = conferences.event_strips_for_month(@shown_month)
    @conferences = current_user.conferences
    @notifications = current_user.invitations

  end
  
end
