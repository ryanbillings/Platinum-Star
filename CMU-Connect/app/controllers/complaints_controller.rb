class ComplaintsController < ApplicationController
before_filter :login_required
load_and_authorize_resource

	
 def index
 
    @complaint = Complaint.all
 end
 

  def show
    @complaint = Complaint.find(params[:id])
  end

  def new
    @complaint = Complaint.new
  end

  def create
    @complaint = Complaint.new(params[:complaint])
    @rando_chat = RandoChat.find(params[:complaint][:rando_chat_id])
    if current_user.id == @rando_chat.u1_id
      reported_user = User.find(@rando_chat.u2_id)
    else
      reported_user = User.find(@rando_chat.u1_id)
    end
    if reported_user.nil?
      redirect_to :welcome
      return 
   end
    reported_user_name = reported_user.andrew
    @complaint.to_user = reported_user_name
    @complaint.from_user = current_user.andrew
    if @complaint.save
      redirect_to :welcome, :notice => "Successfully reported user."
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
    @complaint = Complaint.find(params[:id])
    @complaint.destroy
    redirect_to complaints_url, :notice => "Successfully destroyed complaint"
  end





end
