require "application_system_test_case"

class WishedGamesTest < ApplicationSystemTestCase
  setup do
    @wished_game = wished_games(:one)
  end

  test "visiting the index" do
    visit wished_games_url
    assert_selector "h1", text: "Wished Games"
  end

  test "creating a Wished game" do
    visit wished_games_url
    click_on "New Wished Game"

    click_on "Create Wished game"

    assert_text "Wished game was successfully created"
    click_on "Back"
  end

  test "updating a Wished game" do
    visit wished_games_url
    click_on "Edit", match: :first

    click_on "Update Wished game"

    assert_text "Wished game was successfully updated"
    click_on "Back"
  end

  test "destroying a Wished game" do
    visit wished_games_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wished game was successfully destroyed"
  end
end
