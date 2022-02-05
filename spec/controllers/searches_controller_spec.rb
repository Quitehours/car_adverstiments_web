RSpec.describe SearchesController, type: :controller do
  describe '#index' do
    render_views
    context "when user isn't authenticated" do
      it 'redirect to page login' do
        get :index
        expect(response).to have_http_status(302)
      end
    end

    context "when user authenticated" do
      let(:user) { create(:user, :with_searches) }
      
      before do
        allow(controller).to receive(:authenticate_user!).and_return(true)
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'searches history not blank' do
        get :index
        expect(controller.instance_variable_get(:@searches)).to match_array(user.searches)
      end

      it 'searches history blank' do
      end

      it 'views render correct' do
        get :index
        expect(response.body).to match(/All searches:/)
      end
    end
  end
end
