require "application_system_test_case"

class PostingsTest < ApplicationSystemTestCase
  setup do
    @posting = postings(:one)
  end

  test "visiting the index" do
    visit postings_url
    assert_selector "h1", text: "Postings"
  end

  test "should create posting" do
    visit postings_url
    click_on "New posting"

    click_on "Create Posting"

    assert_text "Posting was successfully created"
    click_on "Back"
  end

  test "should update Posting" do
    visit posting_url(@posting)
    click_on "Edit this posting", match: :first

    click_on "Update Posting"

    assert_text "Posting was successfully updated"
    click_on "Back"
  end

  test "should destroy Posting" do
    visit posting_url(@posting)
    click_on "Destroy this posting", match: :first

    assert_text "Posting was successfully destroyed"
  end
end
