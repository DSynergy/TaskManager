ENV['TASK_MANAGER_ENV'] ||= 'test'
#make sure the environment exists(arbitrary name), otherwise set to test environment

require 'bundler'
Bundler.require

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'sequel'

class ModelTest < Minitest::Test
  def teardown
    TaskManager.delete_all
  end
end
#dump database after each test


Capybara.app = TaskManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL

  def teardown
    TaskManager.delete_all
  end
end
