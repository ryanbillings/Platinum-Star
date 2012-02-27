require 'test_helper'

class ThemeChatsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ThemeChat.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ThemeChat.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ThemeChat.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to theme_chat_url(assigns(:theme_chat))
  end

  def test_edit
    get :edit, :id => ThemeChat.first
    assert_template 'edit'
  end

  def test_update_invalid
    ThemeChat.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ThemeChat.first
    assert_template 'edit'
  end

  def test_update_valid
    ThemeChat.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ThemeChat.first
    assert_redirected_to theme_chat_url(assigns(:theme_chat))
  end

  def test_destroy
    theme_chat = ThemeChat.first
    delete :destroy, :id => theme_chat
    assert_redirected_to theme_chats_url
    assert !ThemeChat.exists?(theme_chat.id)
  end
end
