require 'test_helper'

class FlagsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Flag.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Flag.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Flag.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to flag_url(assigns(:flag))
  end
  
  def test_edit
    get :edit, :id => Flag.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Flag.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Flag.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Flag.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Flag.first
    assert_redirected_to flag_url(assigns(:flag))
  end
  
  def test_destroy
    flag = Flag.first
    delete :destroy, :id => flag
    assert_redirected_to flags_url
    assert !Flag.exists?(flag.id)
  end
end
