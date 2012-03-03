class ConferencesController < ApplicationController
  def index
    @conferences = Conference.all
  end

  def show
    @conference = Conference.find(params[:id])
  end

  def new
    @conference = Conference.new
  end

  def create
    @conference = Conference.new(params[:conference])
    @conference.host_id = current_user.id
    if @conference.save
      redirect_to @conference, :notice => "Successfully created conference."
    else
      render :action => 'new'
    end
  end

  def edit
    @conference = Conference.find(params[:id])
  end

  def update
    @conference = Conference.find(params[:id])
    if @conference.update_attributes(params[:conference])
      redirect_to @conference, :notice  => "Successfully updated conference."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @conference = Conference.find(params[:id])
    @conference.destroy
    redirect_to conferences_url, :notice => "Successfully destroyed conference."
  end
end
