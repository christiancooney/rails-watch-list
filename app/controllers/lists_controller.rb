class ListsController < ApplicationController

  before_action :set_list, only: %i[show edit]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(strong_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
    @movies = Movie.all
  end

  def update
    @list.update(strong_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def strong_params
    params.require(:list).permit(:name)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
