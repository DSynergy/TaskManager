require 'bundler'
Bundler.require
#require sinatra and gems

require 'pathname'
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
# set the pathname (part of standard library) for the root of the app

Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
# require the controller(s)

Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }
# require the model(s)


class TaskManagerApp < Sinatra::Base
  set :method_override, true
  #tells Sinatra to make sure there is a _method param, if so value overrides the original verb. (Put over post)
  set :root, APP_ROOT.to_path
  #sets root path to constant APP_ROOT (task_manager) created above
  set :views, File.join(TaskManagerApp.root, "app", "views")
  #sets views rootpath of views folder to root/app/views
  set :public_folder, File.join(TaskManagerApp.root, "app", "public")
  #sets public rootpath of public folder to root/app/public
end
# configure TaskManagerApp settings
