require "application_system_test_case"

class EscapesTest < ApplicationSystemTestCase
  setup do
    @escape = escapes(:one)
  end

  test "visiting the index" do
    visit escapes_url
    assert_selector "h1", text: "Escapes"
  end

  test "creating a Escape" do
    visit escapes_url
    click_on "New Escape"

    fill_in "Ip Address", with: @escape.ip_address
    fill_in "Organiser", with: @escape.organiser
    fill_in "Payload", with: @escape.payload
    fill_in "Success", with: @escape.success
    click_on "Create Escape"

    assert_text "Escape was successfully created"
    click_on "Back"
  end

  test "updating a Escape" do
    visit escapes_url
    click_on "Edit", match: :first

    fill_in "Ip Address", with: @escape.ip_address
    fill_in "Organiser", with: @escape.organiser
    fill_in "Payload", with: @escape.payload
    fill_in "Success", with: @escape.success
    click_on "Update Escape"

    assert_text "Escape was successfully updated"
    click_on "Back"
  end

  test "destroying a Escape" do
    visit escapes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Escape was successfully destroyed"
  end
end
