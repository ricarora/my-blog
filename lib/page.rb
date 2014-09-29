require './lib/post'

class Collection

  def initialize
    @page = 1
    @per_page = 5
    #@total = 3
    @total = Post.all.count
  end

  def pages
    1..(@total / @per_page)
  end

  def next_page
    @page + 1 if pages.include?(@page + 1)
  end

  def previous_page
    @page - 1 if pages.include?(@page - 1)
  end

  def range_of_post
    @page * 5
  end

  def posts_on_page
    ppp = []
    5.times {|n| ppp << Post.sorted_by_date[@page - n]}
    ppp.reverse
  end

end
