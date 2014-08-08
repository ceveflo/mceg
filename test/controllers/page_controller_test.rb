require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get galeria" do
    get :galeria
    assert_response :success
  end

  test "should get audio" do
    get :audio
    assert_response :success
  end

  test "should get videos" do
    get :videos
    assert_response :success
  end

  test "should get guiriguiri" do
    get :guiriguiri
    assert_response :success
  end

end
