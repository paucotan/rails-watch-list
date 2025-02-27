class BookmarksController < ApplicationController
  before_action :set_list

  def new
    @bookmark = @Bookmark.new
    # @movies = Movie.all
  end

  def create
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to @list
    else
      render :new, status: :unprocesable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to @list, notice: 'bookmark was successfully deleted'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id)
  end
end
