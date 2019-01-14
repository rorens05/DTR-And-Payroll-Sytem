require 'test_helper'

class SalaryTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salary_type = salary_types(:one)
  end

  test "should get index" do
    get salary_types_url
    assert_response :success
  end

  test "should get new" do
    get new_salary_type_url
    assert_response :success
  end

  test "should create salary_type" do
    assert_difference('SalaryType.count') do
      post salary_types_url, params: { salary_type: { daily_rate: @salary_type.daily_rate, hourly_rate: @salary_type.hourly_rate, name: @salary_type.name, overtime_rate: @salary_type.overtime_rate } }
    end

    assert_redirected_to salary_type_url(SalaryType.last)
  end

  test "should show salary_type" do
    get salary_type_url(@salary_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_salary_type_url(@salary_type)
    assert_response :success
  end

  test "should update salary_type" do
    patch salary_type_url(@salary_type), params: { salary_type: { daily_rate: @salary_type.daily_rate, hourly_rate: @salary_type.hourly_rate, name: @salary_type.name, overtime_rate: @salary_type.overtime_rate } }
    assert_redirected_to salary_type_url(@salary_type)
  end

  test "should destroy salary_type" do
    assert_difference('SalaryType.count', -1) do
      delete salary_type_url(@salary_type)
    end

    assert_redirected_to salary_types_url
  end
end
