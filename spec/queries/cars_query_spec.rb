RSpec.describe CarsQuery do
  describe '#initialize' do
    let(:cars) { create_list(:car, 10) }

    context 'when initialize params provided' do
      let(:initial_cars) { described_class.new(cars) }

      it 'return provided list of cars' do
        expect(initial_cars.instance_variable_get(:@initial_cars).to_a).to match_array(cars)
      end
    end

    context 'when initialize params not provided' do
      let(:initial_cars) { described_class.new }
      let(:expected_value) { Car.all }

      it 'return all list of cars' do
        expect(initial_cars.instance_variable_get(:@initial_cars).to_a).to eq(expected_value)
      end
    end
  end

  describe '#call' do
    context 'with empty params' do
      before { create_list(:car, 10) }

      let(:cars_query_call) { described_class.new(cars_list).call(params) }
      let(:cars_list) { Car.all }
      let(:params) { {} }

      it 'sorts' do
        expect(cars_query_call.to_sql).to include('ORDER BY "cars"."price" DESC')
      end

      it 'paginates limit' do
        expect(cars_query_call.to_sql).to include('LIMIT')
      end

      it 'paginates offset' do
        expect(cars_query_call.to_sql).to include('OFFSET')
      end

      it 'return all list of cars' do
        expect(cars_query_call.total_count).to eq(cars_list.size)
      end
    end

    context 'when params pass' do
      let(:expected_search) { create(:search) }

      it "correct query by 'make'" do
        expect(described_class.new.call(make: expected_search[:make]).to_sql).to include('make ILIKE')
      end

      it "filtering by 'make'" do
        expected_cars = create_list(:car, 3, make: expected_search[:make])
        expect(described_class.new.call(make: expected_search[:make])).to match_array(expected_cars)
      end

      it "correct query by 'model'" do
        expect(described_class.new.call(model: expected_search[:model]).to_sql).to include('model ILIKE')
      end

      it "filtering by 'model'" do
        expected_cars = create_list(:car, 3, model: expected_search[:model])
        expect(described_class.new.call(model: expected_search[:model])).to match_array(expected_cars)
      end

      it "correct query by 'price_from'" do
        expect(described_class.new.call(price_from: expected_search[:price_from]).to_sql).to include('price >')
      end

      it "filtering by 'price_from'" do
        expected_cars = create_list(:car, 3, price: expected_search[:price_from])
        expect(described_class.new.call(price_from: expected_search[:price_from])).to match_array(expected_cars)
      end

      it "correct query by 'price_to'" do
        expect(described_class.new.call(price_to: expected_search[:price_to]).to_sql).to include('price <=')
      end

      it "filtering by 'price_to'" do
        expected_cars = create_list(:car, 3, price: expected_search[:price_to])
        expect(described_class.new.call(price_to: expected_search[:price_to])).to match_array(expected_cars)
      end

      it "correct query by 'year_from'" do
        expect(described_class.new.call(year_from: expected_search[:year_from]).to_sql).to include('year >=')
      end

      it "filtering by 'year_from'" do
        expected_cars = create_list(:car, 3, year: expected_search[:year_from])
        expect(described_class.new.call(year_from: expected_search[:year_from])).to match_array(expected_cars)
      end

      it "correct query by 'year_to'" do
        expect(described_class.new.call(year_to: expected_search[:year_to]).to_sql).to include('year <=')
      end

      it "filtering by 'year_to'" do
        expected_cars = create_list(:car, 3, year: expected_search[:year_to])
        expect(described_class.new.call(year_to: expected_search[:year_to])).to match_array(expected_cars)
      end
    end
  end
end
