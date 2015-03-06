require 'bundler' #require the bundlers
Bundler.require #requires everything in your gemfile

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/app"))
#changes the load path. Unshift adds to first part

require File.expand_path('../config/environment',  __FILE__)
#require your environment configurations

run TaskManagerApp #run the class TaskManagerApp
