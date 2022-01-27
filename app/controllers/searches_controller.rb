class SearchesController < ApplicationController
  def index
    @searches = current_user.searches.order created_at: :desc
  end

  def new
    @search = Search.new
  end

  def create
    ccurrent_user&.searches&.create!(create_params)

    redirect_to cars_path(create_params)
  end

  private

  def create_params
    params.require(:search).permit(:make, :model, :price_from, :price_to, :year_from, :year_to)
  end
end
