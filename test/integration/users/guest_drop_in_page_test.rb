require 'test_helper'

class UserVisitsHomePageTest < ActionDispatch::IntegrationTest
  setup do
    @test_user = users :confirmedUser
    @event = events :one

    visit studyhall_path
  end

  test "daily view button should exist" do
    within("div.col-md-12.col-sm-12.col-xs-10.pl-0.ml-2.justify-content-center.pr-1") do
      click_on("Daily View")
    end
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


end