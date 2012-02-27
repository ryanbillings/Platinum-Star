class ThemeChatsController < ApplicationController
  def index
    @theme_chats = ThemeChat.all
  end

  def show
    @theme_chat = ThemeChat.find(params[:id])
  end

  def new
    @theme_chat = ThemeChat.new
  end

  def create
    @theme_chat = ThemeChat.new(params[:theme_chat])
    if @theme_chat.save
      redirect_to @theme_chat, :notice => "Successfully created theme chat."
    else
      render :action => 'new'
    end
  end

  def edit
    @theme_chat = ThemeChat.find(params[:id])
  end

  def update
    @theme_chat = ThemeChat.find(params[:id])
    if @theme_chat.update_attributes(params[:theme_chat])
      redirect_to @theme_chat, :notice  => "Successfully updated theme chat."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @theme_chat = ThemeChat.find(params[:id])
    @theme_chat.destroy
    redirect_to theme_chats_url, :notice => "Successfully destroyed theme chat."
  end
end
