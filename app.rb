require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/json'

set :bind, '0.0.0.0'

get '/*' do
  path = request.path_info

  json(
    message: "Welcome from kong-sample-service on Sinatra!",
    path: path,
    env: request.env
  )
end
