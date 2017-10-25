class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  
  def index
    @books = Book.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @book = Book.find(params[:id])
    @book_review = Review.new
    
    @average_rating = @book.reviews.average(:rating) if not @book.reviews.empty?
    @review_count = @book.reviews.count if not @book.reviews.empty?
    
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    
    if @book.save
      flash[:success] = "#{@book.title} has been added to PrettyGoodReads."
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    
    if @book.update(book_params)
      flash[:success] = "#{@book.title} was successfully updated."
      redirect_to @book
    else
      render 'edit'
    end
  end
  
  def destroy
    @book.delete
    flash[:success] = "Book deleted successfully."
    redirect_to book_path
  end
  
  private
  
  def find_book
    @book = Book.find(params[:id])
  end
  
  def book_params
    params.require(:book).permit(:title, :author, :publisher, :ISBN, :year_published, :synopsis)
  end
  
end