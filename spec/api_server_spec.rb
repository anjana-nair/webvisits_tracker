require_relative '../api_server.rb'
require 'spec_helper.rb'
require 'rspec'
require 'rack/test'
require 'simplecov'
require 'factory_girl'
require 'pry'
SimpleCov.start


set :environment, :test

describe 'ApiServer' do
  include Rack::Test::Methods


  def app
    Sinatra::Application
  end

  it "should load successfully" do
    get '/'
    expect(last_response.status).to eq 200
  end

  it "should load ok" do
    get '/'
    expect(last_response).to be_ok
  end

  it "will load the root api url page" do
    get '/'
    expect(last_response.body).to include('Welcome to our page visits tracker!') 
  end  

  it "will show error on the referrer name format along with the response" do
    get '/api/v1/'
    expect(last_response.body).to include("24.6.5.33") 
  end  
end