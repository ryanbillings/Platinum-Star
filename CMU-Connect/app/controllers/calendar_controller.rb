class CalendarController < ApplicationController
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Conference.event_strips_for_month(@shown_month)
    @conferences = current_user.conferences
  end
  
end
