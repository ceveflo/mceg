require 'test_helper'

class ExportControllerTest < ActionController::TestCase
  test "should get brigtcove" do
    get :brigtcove
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

end
