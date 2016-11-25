class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @list = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
    flash[:notice] = "List successfully created."

      redirect_to @list
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "List successfully deleted."

    redirect_to @list
  end

  private
    def list_params
      params.require(:list).permit(:name, tasks_attributes: [:title, :description, :due_date, :status])
    end

end
