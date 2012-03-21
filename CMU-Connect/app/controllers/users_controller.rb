class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    begin
      andrew_user = CMU::Person.find(@user.andrew)
    rescue
      redirect_to :signup, :notice => "Invalid Andrew ID"
      return
    end
    @user.first_name = andrew_user.first_name
    @user.last_name = andrew_user.last_name
    @user.email = andrew_user.email
    @user.grade = andrew_user.grade
    @user.major = andrew_user.department
	@user.role = "default"
    if @user.save
      session[:user_id] = @user.id
      redirect_to :welcome, :notice => "Thank you for signing up! You are now logged in."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to :welcome, :notice => "Your account has been updated."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
     @user = User.find(params[:id])
     session[:user_id] = nil
     @user.destroy
     redirect_to :landing, :notice => "Your account has been deleted."
  end
end
