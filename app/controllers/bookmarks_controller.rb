class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movie = Movie.all
    @movienames = []
    @movie.each do |movie|
      @movienames << movie.title
    end
  end

  def create
    @bookmark = Bookmarks.new(bookmark_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = Bookmarks.find(params[:bookmark])
    const list = @bookmark.list
    redirect_to list_path(list)
  end

  private

  def list_params
    params.require(:list).permit(:comment, :movie_id, :list_id)
  end
end
