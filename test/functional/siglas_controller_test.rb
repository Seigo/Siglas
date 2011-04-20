require 'test_helper'

class SiglasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Sigla.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Sigla.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Sigla.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to sigla_url(assigns(:sigla))
  end
  
  def test_edit
    get :edit, :id => Sigla.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Sigla.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Sigla.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Sigla.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Sigla.first
    assert_redirected_to sigla_url(assigns(:sigla))
  end
  
  def test_destroy
    sigla = Sigla.first
    delete :destroy, :id => sigla
    assert_redirected_to siglas_url
    assert !Sigla.exists?(sigla.id)
  end
end
