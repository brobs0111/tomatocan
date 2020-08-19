require 'test_helper'

class UserVisitsHomePageTest < ActionDispatch::IntegrationTest
  setup do
    @test_user = users :confirmedUser
    @event = events :one

    sign_in
    visit studyhall_path
  end


  test "post dropin button should exist and reach correct path" do
    within("div.col-md-8.col-sm-12.text-left.pl-2") do
      click_on("Post Drop-In Hour")
      assert_equal current_path, new_event_path
    end
  end

  test "daily view button should exist" do

  end

  def sign_in
    visit root_path

    click_on('Sign In', match: :first)

    fill_in(id: 'user_email', with: 'thinqtesting@gmail.com')
    fill_in(id: 'user_password', with: 'user1234')

    click_on(class: 'form-control btn-primary')
  end

end