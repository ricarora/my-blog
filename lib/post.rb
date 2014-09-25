class Post
  # Access posts, files within views/posts
  # attributes: title, url, filename, content

  # Read my list of post files
  # Create an array of Post objects with the attributes set
  # Post.all => [post, post]
attr_accessor :title, :url

  def initialize(array)
    @title = array[-1].sub(".erb", "")
    @url = "/posts/#{@title}"

  end

  def self.all
    Dir.glob("views/posts/*.erb").collect do |filepath|
      a = filepath.split("/")
      self.new(a)
    end
  end

end
