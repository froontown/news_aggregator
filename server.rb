require 'sinatra'
require 'sinatra/reloader'
require 'csv'
# require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

get '/articles/new' do
  erb :index
end

get '/articles' do
  @articles = CSV.read('articles.csv')
  erb :show
end

post '/articles/new' do
  article_title = params['article_title']
  article_url = params['article_url']
  article_description = params['article_description']

  CSV.open('articles.csv', 'a') do |article|
    article << [article_title, article_url, article_description]
  end

  redirect '/articles'
end
