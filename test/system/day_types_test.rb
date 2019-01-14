require "application_system_test_case"

class DayTypesTest < ApplicationSystemTestCase
  setup do
    @day_type = day_types(:one)
  end

  test "visiting the index" do
    visit day_types_url
    assert_selector "h1", text: "Day Types"
  end

  test "creating a Day type" do
    visit day_types_url
    click_on "New Day Type"

    fill_in "Date created", with: @day_type.date_created
    fill_in "Regular", with: @day_type.regular
    fill_in "User", with: @day_type.user_id
    click_on "Create Day type"

    assert_text "Day type was successfully created"
    click_on "Back"
  end

  test "updating a Day type" do
    visit day_types_url
    click_on "Edit", match: :first

    fill_in "Date created", with: @day_type.date_created
    fill_in "Regular", with: @day_type.regular
    fill_in "User", with: @day_type.user_id
    click_on "Update Day type"

    assert_text "Day type was successfully updated"
    click_on "Back"
  end

  test "destroying a Day type" do
    visit day_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Day type was successfully destroyed"
  end
end
