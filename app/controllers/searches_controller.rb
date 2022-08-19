class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @searchs = User.all
  end
  
  def search
    @range = params[:range]
    
    if @range =="User"
      @users =User.looks(params[:search], params[:word])
      
  
    else
      @books = Book.looks(params[:search],params[:word])
      
    end
  end
  
  private
  def search_demo
    @q = User.ransack(params[:q])
  end
end
