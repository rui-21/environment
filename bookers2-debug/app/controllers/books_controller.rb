class BooksController < ApplicationController
  before_action :ensure_correct_book_user, only: [:edit]

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = User.find_by(id: @book.user_id)
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @new_book = Book.new
      @books = Book.all
      render 'index'
    end
  end

  def edit
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render 'edit'
    end
  end

  def destroy
    Book.find_by(id: params[:id]).destroy
    redirect_to books_path
  end

  private

  def book_params
    params[:book].permit(:title, :body)
  end

  def ensure_correct_book_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end

end
