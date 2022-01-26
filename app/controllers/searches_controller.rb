class SearchesController < ApplicationController
  def index
    @searches = current_user.searches.order created_at: :desc
  end

  def new
    @search = Search.new
  end

  def create
    @search = current_user.searches.build(create_params).save if current_user
    redirect_to cars_path(create_params)
  end

  private

  def create_params
    params.require(:search).permit(:make, :model, :price_from, :price_to, :year_from, :year_to)
  end
end
