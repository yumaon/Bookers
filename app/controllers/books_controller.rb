class BooksController < ApplicationController
  def new
  end

  def create
    book=Book.new(book_params)
    if book.save
      flash[:notice]="Book was successfully created."
    end
    redirect_to book_path(book.id)
  end

  def index
    @book=Book.new
    @books=Book.all
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    book=Book.find(params[:id])
    if book.update(book_params)
      flash[:notice]="Book was successfully updated."
    end
    redirect_to book_path(book.id)
  end

  def destroy
    book=Book.find(params[:id])
    if book.destroy
      flash[:notice]="Book was successfully destroyed."
    end
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
