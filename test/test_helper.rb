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
