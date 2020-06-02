require 'test_helper'

class USER_SIGN_INTest < ActionDispatch::IntegrationTest
  setup
    @user = users :one
    @event = events :one

    sign_in
  end

  test "error message displayed" do


  end

def sign_in
  visit root_path

  click_on('Sign In', match: :first)

  fill_in(id: 'user_email', with: 'fake@fake.com')
  fill_in(id: 'user_password', with: 'user1234')

  click_on(class: 'form-control btn-primary')
end