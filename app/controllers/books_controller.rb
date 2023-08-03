class BooksController < ApplicationController
  def index
    @books = Book.all

    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Create completed successfully."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "Create failed."
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Update completed successfully."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "Update failed."
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Destroy completed successfully."
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
