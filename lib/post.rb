class Post
  # Access posts, files within views/posts
  # attributes: title, url, filename, content

  # Read my list of post files
  # Create an array of Post objects with the attributes set
  # Post.all => [post, post]
  attr_accessor :title, :date, :url
  
  def initialize(array)
    @title = array[-1].sub(".erb", "")
    @date = array[-2]
    @url = "/posts/#{@date}/#{@title}"
  end

  def read
    File.read("./views/#{@url}.erb")
  end

  def self.all
    Dir.glob("views/posts/**/*.erb").collect do |filepath|
      a = filepath.split("/")
      self.new(a)
    end
  end

  def self.sorted_by_date
    Post.all.sort_by {|post| post.date }.reverse
  end

  def self.most_recent(n)
    sorted_by_date.first(n)
  end


end
