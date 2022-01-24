class CarsController < ApplicationController
  def index
    @cars = CarsQuery.new.call(index_params)
  end

  private

  def index_params
    params.permit(:make, :model, :price_from, :price_to, :year_from, :year_to, :sort_type, :sort_direction)
  end
end
