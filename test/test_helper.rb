# Load the normal Rails helper
require File.expand_path(File.dirname(__FILE__) + '/../../../test/test_helper')

module PluginFixturesClassMethods
  def plugin_fixtures(*fixture_names)
    ActiveRecord::FixtureSet.create_fixtures(
      File.join(File.dirname(__FILE__), 'fixtures'),
      fixture_names
    )
  end
end

ActiveSupport::TestCase.extend(PluginFixturesClassMethods)

# Common setup for integration tests of the relay total pages.
module WorkTimeRelayTotalTestSetup
  def setup
    super
    Project.find(1).enable_module!(:work_time)
    Role.find(1).add_permission!(:view_work_time_tab)
    WtMemberOrder.delete_all
    WtTicketRelay.delete_all
    WtProjectOrders.delete_all
  end
end
