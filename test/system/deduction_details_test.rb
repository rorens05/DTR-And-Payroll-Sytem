require "application_system_test_case"

class DeductionDetailsTest < ApplicationSystemTestCase
  setup do
    @deduction_detail = deduction_details(:one)
  end

  test "visiting the index" do
    visit deduction_details_url
    assert_selector "h1", text: "Deduction Details"
  end

  test "creating a Deduction detail" do
    visit deduction_details_url
    click_on "New Deduction Detail"

    fill_in "Fixed deduction", with: @deduction_detail.fixed_deduction
    fill_in "Name", with: @deduction_detail.name
    fill_in "Percentage", with: @deduction_detail.percentage
    click_on "Create Deduction detail"

    assert_text "Deduction detail was successfully created"
    click_on "Back"
  end

  test "updating a Deduction detail" do
    visit deduction_details_url
    click_on "Edit", match: :first

    fill_in "Fixed deduction", with: @deduction_detail.fixed_deduction
    fill_in "Name", with: @deduction_detail.name
    fill_in "Percentage", with: @deduction_detail.percentage
    click_on "Update Deduction detail"

    assert_text "Deduction detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Deduction detail" do
    visit deduction_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Deduction detail was successfully destroyed"
  end
end
