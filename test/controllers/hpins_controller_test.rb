require 'test_helper'

class HpinsControllerTest < ActionController::TestCase
  setup do
    @hpin = hpins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hpins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hpin" do
    assert_difference('Hpin.count') do
      post :create, hpin: { description: @hpin.description }
    end

    assert_redirected_to hpin_path(assigns(:hpin))
  end

  test "should show hpin" do
    get :show, id: @hpin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hpin
    assert_response :success
  end

  test "should update hpin" do
    patch :update, id: @hpin, hpin: { description: @hpin.description }
    assert_redirected_to hpin_path(assigns(:hpin))
  end

  test "should destroy hpin" do
    assert_difference('Hpin.count', -1) do
      delete :destroy, id: @hpin
    end

    assert_redirected_to hpins_path
  end
end
