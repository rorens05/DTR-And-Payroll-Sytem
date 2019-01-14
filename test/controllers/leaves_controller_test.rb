require 'test_helper'

class LeavesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leafe = leaves(:one)
  end

  test "should get index" do
    get leaves_url
    assert_response :success
  end

  test "should get new" do
    get new_leafe_url
    assert_response :success
  end

  test "should create leafe" do
    assert_difference('Leave.count') do
      post leaves_url, params: { leafe: { date_stated: @leafe.date_stated, employee_id: @leafe.employee_id, leave_details_id: @leafe.leave_details_id } }
    end

    assert_redirected_to leafe_url(Leave.last)
  end

  test "should show leafe" do
    get leafe_url(@leafe)
    assert_response :success
  end

  test "should get edit" do
    get edit_leafe_url(@leafe)
    assert_response :success
  end

  test "should update leafe" do
    patch leafe_url(@leafe), params: { leafe: { date_stated: @leafe.date_stated, employee_id: @leafe.employee_id, leave_details_id: @leafe.leave_details_id } }
    assert_redirected_to leafe_url(@leafe)
  end

  test "should destroy leafe" do
    assert_difference('Leave.count', -1) do
      delete leafe_url(@leafe)
    end

    assert_redirected_to leaves_url
  end
end
