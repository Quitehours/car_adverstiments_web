RSpec.describe CarsQuery do
  # describe '#initialize' do
  #   context 'when initialize param provided' do
  #     it ''
  #   end
    
  #   context 'when initialize param not provided' do
  #     # let(:)
  #     it '' do
        
  #     end
  #   end
  # end
  describe '#call' do
    before { create_list(:car, 10) }

    context 'with empty params' do
      subject { described_class.new(initial_cars).call(params) }
  
      let(:initial_cars) { Car.all }
      let(:params) { {} }

      it 'sorts' do
        binding.pry
        expect(subject.to_sql).to include('ORDER BY "cars"."price" DESC')
      end

      it 'paginates limit' do
        expect(subject.to_sql).to include('LIMIT')
      end

      it 'paginates offset' do
        expect(subject.to_sql).to include('OFFSET')
      end
    end

    context 'when not empty params' do
      subject { described_class.new.call(params) }
  
      let(:initial_cars) { Car.all }
      let(:params) { attributes_for(:search) }

      it "filters 'make'" do
        create(:car, make: params[:make])
        binding.pry
        expect(subject.to_sql).to include("make ILIKE %#{params[:make]}%")
      end
    end
  end 
end
