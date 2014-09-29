require 'sinatra'
require './lib/post'
require './lib/page'

class MyBlog < Sinatra::Base

before do
  @posts = Post.all
end

  get "/" do
    @recent_five = Post.most_recent(5)
    erb :home
  end

  post "/" do
    puts params.inspect
    # Add input into database
    redirect to("/")
  end

  get "/about-me" do
    erb :about_me
  end

  get "/posts" do
      erb :post_index
  end

  get "/posts/:post_date/:post_name" do
    post_name = params[:post_name]
    post_date = params[:post_date]
    erb :"posts/#{post_date}/#{post_name}"
  end

end
