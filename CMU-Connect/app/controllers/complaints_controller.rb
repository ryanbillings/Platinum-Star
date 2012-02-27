class ComplaintsController < ApplicationController

load_and_authorize_resource

	
 def index
 
    @complaints = Complaint.all
  end

  def show
    @complaint = Complaint.find(params[:id])
  end

  def new
    @complaint = Complaint.new
  end

  def create
    @complaint = Complaint.new(params[:complaint])
    if @complaint.save
      redirect_to @complaint, :notice => "Successfully created complaint."
    else
      render :action => 'new'
    end
  end

  def edit
    @complaint = Complaint.find(params[:id])
  end

  def update
    @complaint = Complaint.find(params[:id])
    if @complaint.update_attributes(params[:complaint])
      redirect_to @complaint, :notice  => "Successfully updated complaint."
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
