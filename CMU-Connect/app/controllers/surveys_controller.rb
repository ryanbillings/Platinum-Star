class SurveysController < ApplicationController
  before_filter :login_required
  load_and_authorize_resource

  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
    @topics = @survey.topics
  end

  def new
    @survey = Survey.new
    topic = @survey.topics.build
  end

  def create
    @survey = Survey.new(params[:survey])
    @survey.topics.each do |t|
      t.count = 0
    end
    if @survey.save
      redirect_to @survey, :notice => "Successfully created survey."
    else
      render :action => 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      redirect_to @survey, :notice  => "Successfully updated survey."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_url, :notice => "Successfully destroyed survey."
  end
end
