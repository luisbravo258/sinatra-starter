#Setup environment
require 'bundler/setup'
require 'dotenv'
Dotenv.load

#Require Dependencies
require "sinatra"
require "sinatra/base"
require "sinatra/activerecord"
require "sinatra/flash"
require "will_paginate"
require 'will_paginate/active_record'
require "will_paginate-bootstrap"
require "pony"
require 'carrierwave'
require 'carrierwave/orm/activerecord'

#Require Helpers
Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each {|file| require file }

#Require Models
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }

#Require Routes
Dir[File.dirname(__FILE__) + '/routes/*.rb'].each {|file| require file }

class MyApplication < Sinatra::Base

  #Configure Sinatra
  set :root,      File.dirname(__FILE__)
  set :sessions,  true
  set :session_secret, 'super secret'

  register Sinatra::Flash 
  register WillPaginate::Sinatra
  register Sinatra::Auth

  #Configure Development
  configure :development do
    require 'pry'
  end

end

CarrierWave.configure do |config|
  config.root = File.dirname(__FILE__) + "/public"
end
