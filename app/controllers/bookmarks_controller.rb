class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movies = Movie.all.order(:title)
  end

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find(bookmark_params[:movie_id])
    @bookmark = Bookmark.new
    @bookmark.list = @list
    @bookmark.movie = @movie
    @bookmark.comment = bookmark_params[:comment]
    if @bookmark.save
      redirect_to list_path(@list)
    else
      redirect_to new_list_bookmark_path(@list)
      @error = "Couldn't complete"
    end
    # raise
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
