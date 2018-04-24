require 'sinatra'
require 'sinatra/activerecord'
require 'giphy'
require_relative './models/Dog'
require_relative './models/Owner'

set :database, {adapter: 'postgresql', database: 'doggydaycare'}

get '/' do
  @num_of_dogs = Dog.count
  @num_of_owners = Owner.count
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

get '/woof' do
  Giphy::Configuration.configure do |config|
    config.version = 'v1'
    config.api_key = ENV['GIPHY_API_KEY']
  end
  @gif = Giphy.random('dog')
  erb :woof
end
