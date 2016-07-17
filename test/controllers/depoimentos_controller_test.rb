require 'test_helper'

class DepoimentosControllerTest < ActionController::TestCase
  setup do
    @depoimento = depoimentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:depoimentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create depoimento" do
    assert_difference('Depoimento.count') do
      post :create, depoimento: { depoimento: @depoimento.depoimento, user_id: @depoimento.user_id }
    end

    assert_redirected_to depoimento_path(assigns(:depoimento))
  end

  test "should show depoimento" do
    get :show, id: @depoimento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @depoimento
    assert_response :success
  end

  test "should update depoimento" do
    patch :update, id: @depoimento, depoimento: { depoimento: @depoimento.depoimento, user_id: @depoimento.user_id }
    assert_redirected_to depoimento_path(assigns(:depoimento))
  end

  test "should destroy depoimento" do
    assert_difference('Depoimento.count', -1) do
      delete :destroy, id: @depoimento
    end

    assert_redirected_to depoimentos_path
  end
end
