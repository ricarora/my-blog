require 'sinatra'

class MyBlog < Sinatra::Base

  get "/" do
    erb :home
  end

end
