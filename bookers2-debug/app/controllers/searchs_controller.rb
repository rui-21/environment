class SearchsController < ApplicationController
  def search
    if params[:search].present?
      @search = params[:search]
      search_method = params[:search_method]

      if params[:table] == "Book"
        @users = User.none
        if search_method == "Exact"
          @books = Book.where('title LIKE ?', "#{@search}")

        elsif search_method == "Prefix"
          @books = Book.where('title LIKE ?', "#{@search}%")

        elsif search_method == "Backward"
          @books = Book.where('title LIKE ?', "%#{@search}")

        elsif search_method == "Partial"
          @books = Book.where('title LIKE ?', "%#{@search}")

        end
      elsif params[:table] == "User"
        @books = Book.none

        if search_method == "Exact"
          @users = User.where('name LIKE ?', "#{@search}")

        elsif search_method == "Prefix"
          @users = User.where('name LIKE ?', "#{@search}%")

        elsif search_method == "Backward"
          @users = User.where('name LIKE ?', "%#{@search}")

        elsif search_method == "Partial"
          @users = User.where('name LIKE ?', "%#{@search}%")

        end
      end
    else
      @users = User.none
      @books = Book.none
    end
  end
end
