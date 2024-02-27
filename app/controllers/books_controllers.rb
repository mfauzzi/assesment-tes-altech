class BooksController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @books = Book.all.page(params[:page]).per(10)
        render json: @books
    end

    def new
        @book = Book.new
    end
  
    def create
        @book = Book.new(book_params)
        if @book.save
          EmailNotificationJob.perform_later(current_user.id, @book.id) # Assuming you have current_user method
          redirect_to books_path
        else
          render :new
        end
    end
  
    private
  
    def book_params
        params.require(:book).permit(:title, :year, :author_id)
    end
end