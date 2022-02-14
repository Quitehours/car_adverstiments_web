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
      let!(:expected_cars) { create_list(:car, 3) }
      let(:cars_query_call) { described_class.new(cars_list).call(params) }
      let(:cars_list) { Car.all }
      let(:params) { {} }

      it 'the last elements are compared with the sorting' do
        expected_result = expected_cars.sort_by { |car| -car.price }.last
        expect(cars_query_call.last).to eql(expected_result)
      end

      it 'return all list of cars' do
        expect(cars_query_call.total_count).to eq(cars_list.size)
      end
    end

    context 'when params pass' do
      let(:expected_search) { create(:search) }

      it "filtering by 'make'" do
        expected_cars = create_list(:car, 3, make: expected_search[:make])
        expect(described_class.new.call(make: expected_search[:make])).to match_array(expected_cars)
      end

      it "filtering by 'model'" do
        expected_cars = create_list(:car, 3, model: expected_search[:model])
        expect(described_class.new.call(model: expected_search[:model])).to match_array(expected_cars)
      end

      it "filtering by 'price_from'" do
        expected_cars = create_list(:car, 3, price: expected_search[:price_from])
        expect(described_class.new.call(price_from: expected_search[:price_from])).to match_array(expected_cars)
      end

      it "filtering by 'price_to'" do
        expected_cars = create_list(:car, 3, price: expected_search[:price_to])
        expect(described_class.new.call(price_to: expected_search[:price_to])).to match_array(expected_cars)
      end

      it "filtering by 'year_from'" do
        expected_cars = create_list(:car, 3, year: expected_search[:year_from])
        expect(described_class.new.call(year_from: expected_search[:year_from])).to match_array(expected_cars)
      end

      it "filtering by 'year_to'" do
        expected_cars = create_list(:car, 3, year: expected_search[:year_to])
        expect(described_class.new.call(year_to: expected_search[:year_to])).to match_array(expected_cars)
      end

      it "the last elements are compared with the sorting 'created_at desc' " do
        params = { sort_type: :created_at, sort_direction: :desc }
        expected_cars = create_list(:car, 3)
        expected_result = expected_cars.sort_by { |car| car.created_at }.reverse.last
        expect(described_class.new.call(params).last).to eql(expected_result)
      end

      it "the last elements are compared with the sorting 'created_at asc' " do
        params = { sort_type: :created_at, sort_direction: :asc }
        expected_cars = create_list(:car, 3)
        expected_result = expected_cars.sort_by { |car| car.created_at }.last
        expect(described_class.new.call(params).last).to eql(expected_result)
      end

      it "the last elements are compared with the sorting 'price asc' " do
        params = { sort_type: :price, sort_direction: :asc }
        expected_cars = create_list(:car, 3)
        expected_result = expected_cars.sort_by { |car| car.price }.last
        expect(described_class.new.call(params).last).to eql(expected_result)
      end
    end
  end
end
