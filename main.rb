     
require 'sinatra'
require './db/db'
require 'bcrypt'
require 'httparty'
# require 'dotenv/load'

enable :sessions


require './controllers/furnitures_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'
require './helpers/sessions_helper'


# get '/' do
#   # HTTParty.get("http://omdbapi.com?apikey=#{ENV['OMDB_API_KEY']}&t=jaws")
#   'Hello'
# end





