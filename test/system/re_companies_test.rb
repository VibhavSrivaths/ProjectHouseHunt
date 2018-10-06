require "application_system_test_case"

class ReCompaniesTest < ApplicationSystemTestCase
  setup do
    @re_company = re_companies(:one)
  end

  test "visiting the index" do
    visit re_companies_url
    assert_selector "h1", text: "Re Companies"
  end

  test "creating a Re company" do
    visit re_companies_url
    click_on "New Re Company"

    click_on "Create Re company"

    assert_text "Re company was successfully created"
    click_on "Back"
  end

  test "updating a Re company" do
    visit re_companies_url
    click_on "Edit", match: :first

    click_on "Update Re company"

    assert_text "Re company was successfully updated"
    click_on "Back"
  end

  test "destroying a Re company" do
    visit re_companies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Re company was successfully destroyed"
  end
end
