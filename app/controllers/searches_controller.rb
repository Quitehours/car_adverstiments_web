class SearchesController < ApplicationController
  def index
    @searches = Search.all
  end

  def new
    @search = Search.new
  end

  def create
    @search = current_user.searches.build(search_params).save if current_user
    redirect_to cars_path(search_params)
  end

  private

  def search_params
    params.require(:search).permit(:make, :model, :price_from, :price_to, :year_from, :year_to)
  end
end
