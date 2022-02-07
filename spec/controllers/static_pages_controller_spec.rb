RSpec.describe StaticPagesController, type: :controller do
  render_views
  describe '#help' do
    before { get :help }

    context 'when success render view' do
      it { is_expected.to respond_with(:ok) }

      it 'view renders correct' do
        expect(response.body).to match(/Help/)
      end
    end

    context 'when not success render view' do
      it { is_expected.not_to respond_with(:internal_server_error) }
    end
  end

  describe '#home' do
    before { get :home }

    context 'when success render view' do
      it { is_expected.to respond_with(:ok) }
    end

    context 'when not success render view' do
      it { is_expected.not_to respond_with(:internal_server_error) }
    end
  end
end
