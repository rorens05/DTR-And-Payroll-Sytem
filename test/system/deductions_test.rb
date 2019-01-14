require "application_system_test_case"

class DeductionsTest < ApplicationSystemTestCase
  setup do
    @deduction = deductions(:one)
  end

  test "visiting the index" do
    visit deductions_url
    assert_selector "h1", text: "Deductions"
  end

  test "creating a Deduction" do
    visit deductions_url
    click_on "New Deduction"

    fill_in "Deduction", with: @deduction.deduction_id
    fill_in "Salary", with: @deduction.salary_id
    click_on "Create Deduction"

    assert_text "Deduction was successfully created"
    click_on "Back"
  end

  test "updating a Deduction" do
    visit deductions_url
    click_on "Edit", match: :first

    fill_in "Deduction", with: @deduction.deduction_id
    fill_in "Salary", with: @deduction.salary_id
    click_on "Update Deduction"

    assert_text "Deduction was successfully updated"
    click_on "Back"
  end

  test "destroying a Deduction" do
    visit deductions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Deduction was successfully destroyed"
  end
end
