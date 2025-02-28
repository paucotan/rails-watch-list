class BookmarksController < ApplicationController
  before_action :set_list

  def new
    @bookmark = Bookmark.new
    # @movies = Movie.all
  end

  def create
    @bookmark = @list.bookmarks.new(bookmark_params)

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    list = @bookmark.list # Store the parent list before deleting the bookmark
    @bookmark.destroy
    redirect_to list_path(list), notice: "Bookmark removed!"
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
