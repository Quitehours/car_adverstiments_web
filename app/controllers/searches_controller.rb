class SearchesController < ApplicationController
  def index
    @searches = Search.all
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(create_params)
    return redirect_to cars_path if @search.save

    render :new
  end

  private

  def create_params
    params.require(:search).permit(:make, :model, :price_from, :price_to, :year_from, :year_to)
  end
end
