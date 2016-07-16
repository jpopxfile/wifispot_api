require 'test_helper'

class WifispotsControllerTest < ActionController::TestCase
  setup do
    @wifispot = wifispots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wifispots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wifispot" do
    assert_difference('Wifispot.count') do
      post :create, wifispot: { address_en: @wifispot.address_en, address_jp: @wifispot.address_jp, category: @wifispot.category, lang_support: @wifispot.lang_support, languages: @wifispot.languages, name_en: @wifispot.name_en, name_jp: @wifispot.name_jp, open_time: @wifispot.open_time, place_code: @wifispot.place_code, postcode: @wifispot.postcode, prefecture: @wifispot.prefecture, procedure: @wifispot.procedure, spot_id: @wifispot.spot_id, ssid: @wifispot.ssid, status: @wifispot.status, tel: @wifispot.tel, url: @wifispot.url, usable_place: @wifispot.usable_place, usable_time: @wifispot.usable_time, x_coord: @wifispot.x_coord, y_coord: @wifispot.y_coord }
    end

    assert_redirected_to wifispot_path(assigns(:wifispot))
  end

  test "should show wifispot" do
    get :show, id: @wifispot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wifispot
    assert_response :success
  end

  test "should update wifispot" do
    patch :update, id: @wifispot, wifispot: { address_en: @wifispot.address_en, address_jp: @wifispot.address_jp, category: @wifispot.category, lang_support: @wifispot.lang_support, languages: @wifispot.languages, name_en: @wifispot.name_en, name_jp: @wifispot.name_jp, open_time: @wifispot.open_time, place_code: @wifispot.place_code, postcode: @wifispot.postcode, prefecture: @wifispot.prefecture, procedure: @wifispot.procedure, spot_id: @wifispot.spot_id, ssid: @wifispot.ssid, status: @wifispot.status, tel: @wifispot.tel, url: @wifispot.url, usable_place: @wifispot.usable_place, usable_time: @wifispot.usable_time, x_coord: @wifispot.x_coord, y_coord: @wifispot.y_coord }
    assert_redirected_to wifispot_path(assigns(:wifispot))
  end

  test "should destroy wifispot" do
    assert_difference('Wifispot.count', -1) do
      delete :destroy, id: @wifispot
    end

    assert_redirected_to wifispots_path
  end
end
