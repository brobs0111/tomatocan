require 'test_helper'

class UserVisitsHomePageTest < ActionDispatch::IntegrationTest
  setup do
    @test_user = users :confirmedUser
    @event = events :one

    visit studyhall_path
  end



  test "xd" do
    skip 'Not implemented'
  end




end