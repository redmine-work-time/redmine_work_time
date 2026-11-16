require File.expand_path('../../test_helper', __FILE__)

class Redmine::ApiTest::WorkTimeRelayTotalTest < Redmine::ApiTest::Base
  include WorkTimeRelayTotalTestSetup

  test "GET /work_time/relay_total/:id.json should return costs as numbers" do
    get '/work_time/relay_total/1.json',
        :params => {:year => 2007, :month => 3, :day => 1},
        :headers => credentials('jsmith')

    assert_response :success
    json = ActiveSupport::JSON.decode(response.body)['total_relay']
    assert_equal 4.25, json['total_cost']
    assert_equal [4.25], json['member_cost'].map { |m| m['cost'] }
    assert_equal [4.25], json['issues_cost'].map { |i| i['cost'] }
  end
end
