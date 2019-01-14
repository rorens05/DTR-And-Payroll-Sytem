require "application_system_test_case"

class DepartmentsTest < ApplicationSystemTestCase
  setup do
    @department = departments(:one)
  end

  test "visiting the index" do
    visit departments_url
    assert_selector "h1", text: "Departments"
  end

  test "creating a Department" do
    visit departments_url
    click_on "New Department"

    fill_in "End time", with: @department.end_time
    fill_in "Manager", with: @department.manager
    fill_in "Name", with: @department.name
    fill_in "Start time", with: @department.start_time
    click_on "Create Department"

    assert_text "Department was successfully created"
    click_on "Back"
  end

  test "updating a Department" do
    visit departments_url
    click_on "Edit", match: :first

    fill_in "End time", with: @department.end_time
    fill_in "Manager", with: @department.manager
    fill_in "Name", with: @department.name
    fill_in "Start time", with: @department.start_time
    click_on "Update Department"

    assert_text "Department was successfully updated"
    click_on "Back"
  end

  test "destroying a Department" do
    visit departments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Department was successfully destroyed"
  end
end
