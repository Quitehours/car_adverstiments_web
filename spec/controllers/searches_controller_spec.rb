RSpec.describe SearchesController, type: :controller do
  render_views
  describe '#index' do
    context "when user isn't authenticated" do
      before { get :index }

      it 'success redirect to page login' do
        expect(response).to redirect_to(:new_user_session)
      end

      it "success redirect with status code '302'" do
        expect(response).to have_http_status(:found)
      end
    end

    context 'when user authenticated' do
      let(:user_with_searches) { create(:user, :with_searches) }
      let(:user_without_searches) { create(:user) }

      let(:authenticated_user_with_searches) do
        allow(controller).to receive(:authenticate_user!).and_return(true)
        allow(controller).to receive(:current_user).and_return(user_with_searches)
        get :index
      end

      let(:authenticated_user_without_searches) do
        allow(controller).to receive(:authenticate_user!).and_return(true)
        allow(controller).to receive(:current_user).and_return(user_without_searches)
        get :index
      end

      it "success status code '200'" do
        authenticated_user_with_searches
        expect(response).to have_http_status(:ok)
      end

      it 'view renders correct' do
        authenticated_user_with_searches
        expect(response.body).to match(/All searches/)
      end

      it 'searches history not blank' do
        authenticated_user_with_searches
        expect(controller.instance_variable_get(:@searches)).to match_array(user_with_searches.searches)
      end

      it 'searches history blank' do
        authenticated_user_without_searches
        expect(controller.instance_variable_get(:@searches)).to match_array(user_without_searches.searches)
      end
    end
  end

  describe '#new' do
    before { get :new }

    let(:expected_value) { Search }
    let(:unexpected_value) { String }

    context 'when initialized success' do
      it 'is a new search' do
        expect(controller.instance_variable_get(:@search)).to be_a_new(expected_value)
      end

      it 'view renders correct' do
        expect(response.body).to match(/New Search/)
      end
    end

    context 'when initialized not success' do
      it "isn't a new search" do
        expect(controller.instance_variable_get(:@search)).not_to be_a_new(unexpected_value)
      end
    end
  end

  describe '#create' do
    let(:user) { create(:user) }
    let(:new_search) { attributes_for(:search) }

    before do
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
    end

    context 'when create search success' do
      it 'create search for user' do
        post :create, params: { search: new_search, user_id: user.id }
        expect(user.searches.first).to have_attributes(new_search)
      end

      it 'redirect to another page' do
        post :create, params: { search: new_search, user_id: user.id }
        expect(response).to have_http_status(:found)
      end

      it 'redirect to cars path with params' do
        post :create, params: { search: new_search, user_id: user.id }
        expect(response).to redirect_to(cars_path(new_search))
      end
    end

    context 'when create search not success' do
      subject(:post_request) { post :create }

      it 'call post request without params' do
        expect { post_request }.to raise_error(ActionController::ParameterMissing)
      end
    end
  end
end
