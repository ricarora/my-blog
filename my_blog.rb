require 'sinatra'

class MyBlog < Sinatra::Base

  get "/" do
    erb :home
  end

  get "/about-me" do
    erb :about_me
  end

  get "/posts" do
      posts_local_folder = '/Users/Tom/Adaacademy/my_blog/views/posts/'
      files = Dir[posts_local_folder + "*.erb"]
      files = files.collect { |file| file.sub(posts_local_folder, '').sub('.erb', '')}
      # fixed_posts = ['first_blog_post', 'second_blog_post']
      fixed_posts = files
      erb :post_index, :locals => {:posts => fixed_posts}
  end

  get "/posts/:post_name" do
    post_name = params[:post_name]
    erb :"posts/#{post_name}"
  end

end
