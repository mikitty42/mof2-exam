require "application_system_test_case"

class NearestStation　sTest < ApplicationSystemTestCase
  setup do
    @nearest_station　 = nearest_station　s(:one)
  end

  test "visiting the index" do
    visit nearest_station　s_url
    assert_selector "h1", text: "Nearest Station　S"
  end

  test "creating a Nearest station　" do
    visit nearest_station　s_url
    click_on "New Nearest Station　"

    click_on "Create Nearest station　"

    assert_text "Nearest station　 was successfully created"
    click_on "Back"
  end

  test "updating a Nearest station　" do
    visit nearest_station　s_url
    click_on "Edit", match: :first

    click_on "Update Nearest station　"

    assert_text "Nearest station　 was successfully updated"
    click_on "Back"
  end

  test "destroying a Nearest station　" do
    visit nearest_station　s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nearest station　 was successfully destroyed"
  end
end
