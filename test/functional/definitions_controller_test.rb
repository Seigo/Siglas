require 'test_helper'

class DefinitionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Definition.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Definition.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Definition.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to definition_url(assigns(:definition))
  end
  
  def test_edit
    get :edit, :id => Definition.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Definition.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Definition.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Definition.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Definition.first
    assert_redirected_to definition_url(assigns(:definition))
  end
  
  def test_destroy
    definition = Definition.first
    delete :destroy, :id => definition
    assert_redirected_to definitions_url
    assert !Definition.exists?(definition.id)
  end
end
