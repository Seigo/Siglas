require 'test_helper'

class UpsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Up.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Up.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Up.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to up_url(assigns(:up))
  end
  
  def test_edit
    get :edit, :id => Up.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Up.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Up.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Up.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Up.first
    assert_redirected_to up_url(assigns(:up))
  end
  
  def test_destroy
    up = Up.first
    delete :destroy, :id => up
    assert_redirected_to ups_url
    assert !Up.exists?(up.id)
  end
end
