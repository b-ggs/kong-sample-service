require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/json'

set :bind, '0.0.0.0'

get '/*' do
  resource_key = ENV['resource']
  resource =
    case resource_key
    when 'random_engg'
      %w(Boggs Rodj JP Jeffrey Kiko Carissa Maynard Diomar Ben Hayden)
    when 'random_letter'
      ('a'..'z').to_a + ('A'..'Z').to_a
    when 'dice_roll'
      (1..6).to_a
    else # random_number
      (0..100).to_a
    end

  json(
    message: resource.sample,
    path: request.path_info,
    debug: {
      env: request.env,
      resource_key: resource_key
    }
  )
end
