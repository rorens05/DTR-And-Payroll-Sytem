require "application_system_test_case"

class SalaryTypesTest < ApplicationSystemTestCase
  setup do
    @salary_type = salary_types(:one)
  end

  test "visiting the index" do
    visit salary_types_url
    assert_selector "h1", text: "Salary Types"
  end

  test "creating a Salary type" do
    visit salary_types_url
    click_on "New Salary Type"

    fill_in "Daily rate", with: @salary_type.daily_rate
    fill_in "Hourly rate", with: @salary_type.hourly_rate
    fill_in "Name", with: @salary_type.name
    fill_in "Overtime rate", with: @salary_type.overtime_rate
    click_on "Create Salary type"

    assert_text "Salary type was successfully created"
    click_on "Back"
  end

  test "updating a Salary type" do
    visit salary_types_url
    click_on "Edit", match: :first

    fill_in "Daily rate", with: @salary_type.daily_rate
    fill_in "Hourly rate", with: @salary_type.hourly_rate
    fill_in "Name", with: @salary_type.name
    fill_in "Overtime rate", with: @salary_type.overtime_rate
    click_on "Update Salary type"

    assert_text "Salary type was successfully updated"
    click_on "Back"
  end

  test "destroying a Salary type" do
    visit salary_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Salary type was successfully destroyed"
  end
end
