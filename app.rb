require 'sinatra'
require 'sinatra/activerecord'
require_relative './models/Dog'
require_relative './models/Owner'

set :database, {adapter: 'postgresql', database: 'doggydaycare'}

get '/' do
  erb :index
end

get '/dogs' do
  @dogs = Dog.all
  erb :dogs
end

get '/owners' do
  @owners = Owner.all
  erb :owners
end

get '/owners/:id' do
  @owner = Owner.find(params[:id])
  @dogs = Dog.where(owner_id: params[:id])
  erb :owner
end
