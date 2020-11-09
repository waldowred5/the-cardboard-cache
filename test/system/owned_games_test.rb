require "application_system_test_case"

class OwnedGamesTest < ApplicationSystemTestCase
  setup do
    @owned_game = owned_games(:one)
  end

  test "visiting the index" do
    visit owned_games_url
    assert_selector "h1", text: "Owned Games"
  end

  test "creating a Owned game" do
    visit owned_games_url
    click_on "New Owned Game"

    click_on "Create Owned game"

    assert_text "Owned game was successfully created"
    click_on "Back"
  end

  test "updating a Owned game" do
    visit owned_games_url
    click_on "Edit", match: :first

    click_on "Update Owned game"

    assert_text "Owned game was successfully updated"
    click_on "Back"
  end

  test "destroying a Owned game" do
    visit owned_games_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Owned game was successfully destroyed"
  end
end
