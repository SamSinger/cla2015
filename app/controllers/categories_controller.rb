class CategoriesController < ApplicationController

  def index

    @category = Category.order("list_order ASC")
    
  end

  def show
    @category = Category.new
  end

  def new
    @category = Category.new
    
  end

  def create
    #binding.pry
    @category = Category.new(category_params)
     

    if @category.save
      flash[:notice] = "The category was created."
      redirect_to category_path
    else
      render 'new'
    end 
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
     
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)

      flash[:notice] = "Your category name or list order was updated."
      redirect_to category_path
    else
      render 'edit'
    end
  end

  private
    def category_params
      params.require(:category).permit!
    end
end