require 'test_helper'

class UserSignInTest < ActionDispatch::IntegrationTest
  setup
    @user = users :one
    @event = events :one

    sign_in
  end

test "user signed in successfully" do
  sign_in do
  assert_no_text("Invalid email or password.")
  end
end

test "error message displayed" do
  page.find("#flash_alert")
end

test"error message has red background" do
  page.has_css?('.alert-danger')
end


def sign_in
  visit root_path

  click_on('Sign In', match: :first)

  fill_in(id: 'user_email', with: 'fake@fake.com')
  fill_in(id: 'user_password', with: 'user1234')

  click_on(class: 'form-control btn-primary')
end