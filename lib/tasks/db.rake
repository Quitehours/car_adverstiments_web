namespace :db do
  namespace :cars do
    desc 'Add cars to database'
    task seed: :environment do
      quantity = ARGV[1].nil? ? 1 : ARGV[1].to_i

      quantity.times do
        Car.create(car_params)
      end

      puts I18n.t('tasks.db.cars_seed', quantity: quantity)
    end

    def car_params
      {
        make: FFaker::Vehicle.make,
        model: FFaker::Vehicle.model,
        year: FFaker::Vehicle.year.to_i,
        price: FFaker::Random.rand(999_999),
        odometer: FFaker::Random.rand(999_999),
        description: FFaker::Lorem.phrase
      }
    end
  end
end
