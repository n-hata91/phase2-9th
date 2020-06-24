class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    favo = current_user.favorites.new(book_id: @book.id)
    favo.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    favo = current_user.favorites.find_by(book_id: @book.id)
    favo.destroy
  end
end
