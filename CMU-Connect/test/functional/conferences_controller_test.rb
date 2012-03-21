require 'test_helper'

class ConferencesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Conference.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Conference.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Conference.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to conference_url(assigns(:conference))
  end

  def test_edit
    get :edit, :id => Conference.first
    assert_template 'edit'
  end

  def test_update_invalid
    Conference.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Conference.first
    assert_template 'edit'
  end

  def test_update_valid
    Conference.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Conference.first
    assert_redirected_to conference_url(assigns(:conference))
  end

  def test_destroy
    conference = Conference.first
    delete :destroy, :id => conference
    assert_redirected_to conferences_url
    assert !Conference.exists?(conference.id)
  end
end
