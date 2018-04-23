require 'sinatra'
require 'sinatra/activerecord'
require_relative './models/Dog'
require_relative './models/Owner'

set :database, {adapter: 'postgresql', database: 'doggydaycare'}
