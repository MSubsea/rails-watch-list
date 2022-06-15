class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movie = Movie.all
    @movienames = []
    @movie.each do |movie|
      @movienames << [movie.id.to_s, movie.title]
    end
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save
    @list = List.find(params[:list_id])
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:list_id])
    list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
