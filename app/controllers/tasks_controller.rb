class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @task = Task.all
  end

  def create
    @task = Task.new(task_params)
    @task.save
    flash[:notice] = "Task successfully created."

    redirect_to task_path(@path)
  end

  def edit
    @task = Task.find(params[:id])
    @task.update(task_params)
    flash[:notice] = "Task successfully updated."

    redirect_to list_path(@task.list)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task successfully deleted."

    redirect_to list_path(@task.list)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status)
  end

end
