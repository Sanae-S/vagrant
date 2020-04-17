class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
  end

  def show
    @book =Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice]="Book was successfuly created."
      redirect_to book_path(book.id)
    else
      render action: :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice]="Book was successsfully destroyed."
      redirect_to books_path
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
