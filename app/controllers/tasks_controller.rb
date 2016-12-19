class TasksController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   @list = List.find_by(params[:list_id])
  #   @tasks = @list.tasks.find_by(params[:id])
  #   #raise "Whoops".inspect
  #   #render :layout => false
  #   render :json => @tasks
  #  end

  def new
    @list = List.find_by(params[:list_id])
    @task = @list.tasks.build
   end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.create(task_params)
    flash[:notice] = "Task created"

    redirect_to list_path(@list)
  end

  def edit
    @list = List.find_by(params[:list_id])
    @task = Task.find_by(params[:id])
   end

   def update
     @task = Task.find(params[:id])
     @task.update(task_params)
     flash[:notice] = "Task Updated"

     redirect_to list_path(@task.list)
   end

  def destroy
    @list = List.find_by(params[:list_id])
    @task = @list.tasks.find_by(params[:id])
    @task.destroy
    flash[:notice] = "Task Deleted"

    redirect_to list_path(@list)
  end


  private

  def task_params
    params.require(:task).permit(:description, :completed)
  end

end
