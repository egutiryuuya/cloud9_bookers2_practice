class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "created successfully"
    redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      flash[:alert] ="created error"
      render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user_id==current_user.id
      render :edit
    else
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "おめでとうpost update successfully"
      redirect_to book_path(@book)
      else 
      flash[:alert] = "残念errorです!"
      render :edit
      end
  end
  
  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
