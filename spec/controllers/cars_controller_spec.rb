RSpec.describe CarsController, type: :controller do
  describe '#index' do
    render_views
    
    context 'when index params not provide' do
      let!(:cars) { create_list(:car, 3) }

      it 'view renders correct' do
        get :index
        expect(response.body).to match(/Cars Quantity:/)
      end

      it "doesn't filter cars" do
        get :index
        expect(controller.instance_variable_get(:@cars).to_a).to match_array(cars)
      end
    end

    context 'when index params provide' do
      let(:expected_make) { FFaker::Vehicle.make }
      let(:unexpected_make) { '1234567890' }
      let!(:expected_cars) { create_list(:car, 3, make: expected_make) }

      it 'view renders correct' do
        get :index, params: { make: expected_make }
        expect(response.body).to include(expected_make)
      end

      it 'filtered` cars' do
        get :index, params: { make: expected_make }
        expect(controller.instance_variable_get(:@cars).to_a).to match_array(expected_cars)
      end

      it 'cars not founded' do
        get :index, params: { make: unexpected_make }
        expect(controller.instance_variable_get(:@cars).to_a).not_to match_array(expected_cars)
      end
    end
  end
end
