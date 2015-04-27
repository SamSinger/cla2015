class DepartmentsController < ApplicationController

  def index

    @department = Department.order("list_order ASC")
    
  end

  def show
    @department = Department.new
  end

  def new
    @department = Department.new
    
  end

  def create
    #binding.pry
    @department = Department.new(department_params)
     

    if @department.save
      flash[:notice] = "The department was created."
      redirect_to new_department_path
    else
      render 'new'
    end 
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
     
    @department = Department.find(params[:id])
    if @department.update_attributes(department_params)

      flash[:notice] = "Your department name or list order was updated."
      redirect_to new_department_path
    else
      render 'edit'
    end
  end

  private
    def department_params
      params.require(:department).permit!
    end
end