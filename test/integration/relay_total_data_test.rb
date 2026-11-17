require File.expand_path('../../test_helper', __FILE__)

class WorkTimeRelayTotalDataTest < Redmine::IntegrationTest
  include WorkTimeRelayTotalTestSetup

  test "GET /work_time/relay_total_data/:id should format hours as decimals" do
    log_user('jsmith', 'jsmith')
    get '/work_time/relay_total_data/1',
        :params => {:year => 2007, :month => 3, :day => 1}

    assert_response :success
    assert_equal 'text/csv', response.media_type
    assert_include %Q|"John Smith","eCookbook","#1 Cannot print recipes",4.25\n|, response.body
    assert_not_include '17/4', response.body
  end
end
