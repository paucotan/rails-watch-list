class BookmarksController < ApplicationController

  def new
    @bookmark = @list.bookmarks.new
    @movies = Movie.all
  end

  def create
    @bookmark = @list.bookmarks.new(bookmark_params)
  end

  def destroy
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
  params.
  end
end
