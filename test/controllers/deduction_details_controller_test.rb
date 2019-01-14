require 'test_helper'

class DeductionDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deduction_detail = deduction_details(:one)
  end

  test "should get index" do
    get deduction_details_url
    assert_response :success
  end

  test "should get new" do
    get new_deduction_detail_url
    assert_response :success
  end

  test "should create deduction_detail" do
    assert_difference('DeductionDetail.count') do
      post deduction_details_url, params: { deduction_detail: { fixed_deduction: @deduction_detail.fixed_deduction, name: @deduction_detail.name, percentage: @deduction_detail.percentage } }
    end

    assert_redirected_to deduction_detail_url(DeductionDetail.last)
  end

  test "should show deduction_detail" do
    get deduction_detail_url(@deduction_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_deduction_detail_url(@deduction_detail)
    assert_response :success
  end

  test "should update deduction_detail" do
    patch deduction_detail_url(@deduction_detail), params: { deduction_detail: { fixed_deduction: @deduction_detail.fixed_deduction, name: @deduction_detail.name, percentage: @deduction_detail.percentage } }
    assert_redirected_to deduction_detail_url(@deduction_detail)
  end

  test "should destroy deduction_detail" do
    assert_difference('DeductionDetail.count', -1) do
      delete deduction_detail_url(@deduction_detail)
    end

    assert_redirected_to deduction_details_url
  end
end
