require 'test_helper'

class LeaveDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leave_detail = leave_details(:one)
  end

  test "should get index" do
    get leave_details_url
    assert_response :success
  end

  test "should get new" do
    get new_leave_detail_url
    assert_response :success
  end

  test "should create leave_detail" do
    assert_difference('LeaveDetail.count') do
      post leave_details_url, params: { leave_detail: { is_payed: @leave_detail.is_payed, name: @leave_detail.name, number_of_days: @leave_detail.number_of_days } }
    end

    assert_redirected_to leave_detail_url(LeaveDetail.last)
  end

  test "should show leave_detail" do
    get leave_detail_url(@leave_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_leave_detail_url(@leave_detail)
    assert_response :success
  end

  test "should update leave_detail" do
    patch leave_detail_url(@leave_detail), params: { leave_detail: { is_payed: @leave_detail.is_payed, name: @leave_detail.name, number_of_days: @leave_detail.number_of_days } }
    assert_redirected_to leave_detail_url(@leave_detail)
  end

  test "should destroy leave_detail" do
    assert_difference('LeaveDetail.count', -1) do
      delete leave_detail_url(@leave_detail)
    end

    assert_redirected_to leave_details_url
  end
end
