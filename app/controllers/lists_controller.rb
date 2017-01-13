class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.lists.all
    respond_to do |format|
      format.json {
        render json: @lists
      }
      format.html
    end

  end

  def show
    @list = current_user.lists.find(params[:id])
  end

  def new
    @list = current_user.lists.build
  end

  def edit
    @list = current_user.lists.find(params[:id])
  end

  def create
    @list = current_user.lists.build(list_params)

    if @list.save!
     flash[:notice] = "List Created"
     redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    flash[:notice] = "List Updated"
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "List Deleted"
    redirect_to root_path
  end

  private
    def list_params
      params.require(:list).permit(:name, :due_date, :categories => [:name])
    end

end
