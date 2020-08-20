require 'test_helper'

class DropInPageTest < ActionDispatch::IntegrationTest
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
    within("div.col-md-12.col-sm-12.col-xs-10.pl-0.ml-2.justify-content-center.pr-1") do
      click_on("Daily View")
    end
  end

  test "7 day of the week buttons should exist" do
    assert_css("button.btn.btn-primary.weekBtn", count: 7)
  end

  test "should be 1 of each day Sunday, Monday, etc." do
    assert_button("Sunday", count: 1)
    assert_button("Monday", count: 1)
    assert_button("Tuesday", count: 1)
    assert_button("Wednesday", count: 1)
    assert_button("Thursday", count: 1)
    assert_button("Friday", count: 1)
    assert_button("Saturday", count: 1)
  end

  test "monthly view button should exist" do
    within("div.col-md-12.col-sm-12.col-xs-10.pl-0.ml-2.justify-content-center.pr-1") do
      click_on("Monthly View")
    end
  end

  test "ux research info tab should exist" do
    within("div.row div.col-md-4 div.container.pl-5 div.card-body.mr-5.pr-5") do
      click_on("UX Research")
      assert_css("div#collapseTwo.collapse")
    end
  end

  test "ruby on rails info button should exist" do
      click_on("RUBY ON RAILS Web Development")
  end

  test "woman developers info button should exist" do
    click_on("WOMAN DEVELOPERS")
  end

  def sign_in
    visit root_path

    click_on('Sign In', match: :first)

    fill_in(id: 'user_email', with: 'thinqtesting@gmail.com')
    fill_in(id: 'user_password', with: 'user1234')

    click_on(class: 'form-control btn-primary')
  end

end