class CarsQuery
  def initialize(initial_cars = Car.all)
    @initial_cars = initial_cars
  end

  def call(rules)
    collection = filter_by_make(@initial_cars, rules[:make])
    collection = filter_by_model(collection, rules[:model])
    collection = filtration_by_price(collection, rules[:price_from], rules[:price_to])
    collection = filtration_by_year(collection, rules[:year_from], rules[:year_to])
    collection = sorting(collection, rules[:sort_type], rules[:sort_direction])
    collection
  end

  private

  def filter_by_make(collection, query = nil)
    query.present? ? collection.where("make ILIKE ?", "%#{query}%") : collection
  end

  def filter_by_model(collection, query = nil)
    query.present? ? collection.where("model ILIKE ?", "%#{query}%") : collection
  end

  def filtration_by_price(collection, from_price = nil, to_price = nil)
    collection = from_price.present? ? collection.where('price > ?', from_price.to_i) : collection
    to_price.present? ? collection.where('price < ?', to_price.to_i) : collection
  end

  def filtration_by_year(collection, from_year = nil, to_year = nil)
    collection = from_year.present? ? collection.where('year > ?', from_year.to_i) : collection
    to_year.present? ? collection.where('year < ?', to_year.to_i) : collection
  end

  def sorting(collection, sort_type, sort_direction)
    sort_type = :price if sort_type.nil?
    sort_direction = :desc if sort_direction.nil?
    collection.order(sort_type => sort_direction)
  end
end
