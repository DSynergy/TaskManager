class TaskManagerApp < Sinatra::Base

  get '/' do #get request for default url
    erb :dashboard #embedded ruby dashboard
  end

  get '/tasks' do #get request for /tasks url
    @tasks = TaskManager.all #All method on taskmanager class stored in @tasks
    erb :index #embedded ruby index
  end

  get '/tasks/new' do #get request for /tasks/new
    erb :new #embedded ruby new
  end

  post '/tasks' do
    TaskManager.create(params[:task]) #taskmanager class, create method injecting params[:task]
    redirect '/tasks'
  end

  get '/tasks/:id' do |id|
    @task = TaskManager.find(id.to_i)
    erb :show
  end

  get '/panic' do
    erb :nuclear
  end

  get '/tasks/:id/edit' do |id|
    @task = TaskManager.find(id.to_i)
    erb :edit
  end

  put '/tasks/:id' do |id|
    TaskManager.update(id.to_i, params[:task])
    redirect "/tasks/#{id}"
  end

  delete '/tasks/:id' do |id|
    TaskManager.delete(id.to_i)
    redirect '/tasks'
  end

  not_found do
    erb :error
  end

end
