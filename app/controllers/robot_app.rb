require 'models/robot_api'

class RobotApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = RobotApi.all
    erb :robots
  end
end