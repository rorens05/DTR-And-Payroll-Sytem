require "application_system_test_case"

class LeaveDetailsTest < ApplicationSystemTestCase
  setup do
    @leave_detail = leave_details(:one)
  end

  test "visiting the index" do
    visit leave_details_url
    assert_selector "h1", text: "Leave Details"
  end

  test "creating a Leave detail" do
    visit leave_details_url
    click_on "New Leave Detail"

    fill_in "Is payed", with: @leave_detail.is_payed
    fill_in "Name", with: @leave_detail.name
    fill_in "Number of days", with: @leave_detail.number_of_days
    click_on "Create Leave detail"

    assert_text "Leave detail was successfully created"
    click_on "Back"
  end

  test "updating a Leave detail" do
    visit leave_details_url
    click_on "Edit", match: :first

    fill_in "Is payed", with: @leave_detail.is_payed
    fill_in "Name", with: @leave_detail.name
    fill_in "Number of days", with: @leave_detail.number_of_days
    click_on "Update Leave detail"

    assert_text "Leave detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Leave detail" do
    visit leave_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leave detail was successfully destroyed"
  end
end
