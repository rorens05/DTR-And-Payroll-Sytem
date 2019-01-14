require 'test_helper'

class DayTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day_type = day_types(:one)
  end

  test "should get index" do
    get day_types_url
    assert_response :success
  end

  test "should get new" do
    get new_day_type_url
    assert_response :success
  end

  test "should create day_type" do
    assert_difference('DayType.count') do
      post day_types_url, params: { day_type: { date_created: @day_type.date_created, regular: @day_type.regular, user_id: @day_type.user_id } }
    end

    assert_redirected_to day_type_url(DayType.last)
  end

  test "should show day_type" do
    get day_type_url(@day_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_day_type_url(@day_type)
    assert_response :success
  end

  test "should update day_type" do
    patch day_type_url(@day_type), params: { day_type: { date_created: @day_type.date_created, regular: @day_type.regular, user_id: @day_type.user_id } }
    assert_redirected_to day_type_url(@day_type)
  end

  test "should destroy day_type" do
    assert_difference('DayType.count', -1) do
      delete day_type_url(@day_type)
    end

    assert_redirected_to day_types_url
  end
end
