class SearchesController < ApplicationController
  def index
    @searches = Search.all
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(create_params)

    if @search.save
      redirect_to cars_path(create_params)
    else
      render :new
    end
  end

  private

  def create_params
    params.require(:search).permit(:make, :model, :price_from, :price_to, :year_from, :year_to)
  end
end
