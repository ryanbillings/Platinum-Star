class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  load_and_authorize_resource
  def index
    @users = User.all
  end

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
    @user.receive_text = false
    pass = User.random_password
    @user.password = pass
    
    if @user.save
      #session[:user_id] = @user.id
      #$logged_in_user.push(@user.id)
      UserMailer.password_reset(@user.email,@user.password).deliver
      redirect_to :login, :notice => "Thank you for signing up! Please check your email for further instructions."
    else
      render :action => 'new'
    end
  end

  def edit
    if current_user.role == "default"
      @user = current_user
    elsif current_user.role == "admin"
      @user = User.find_by_id(params[:id])
    end
  end

  def update
    if current_user.role == "default"
      @user = current_user
    elsif current_user.role == "admin"
      @user = User.find_by_id(params[:id])
    end
    if @user.update_attributes(params[:user])
      redirect_to :welcome, :notice => "Your account has been updated."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
     if current_user.id != params[:id]
       redirect_to :root
       return
     end
     @user = User.find(params[:id])
     session[:user_id] = nil
     @user.destroy
     redirect_to :landing, :notice => "Your account has been deleted."
  end

end
