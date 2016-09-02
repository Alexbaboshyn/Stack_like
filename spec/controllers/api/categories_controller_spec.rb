require 'rails_helper'

RSpec.describe Api::CategoriesController, type: :controller do
  it { should route(:get, 'api/categories').to(action: :index) }

  it { should route(:get, 'api/categories/1').to(action: :show, id: 1) }


  describe '#collection' do
    let(:params) { { page: 5 } }

    before { expect(subject).to receive(:params).and_return(params) }

    before do
      expect(Category).to receive(:page).with(5) do
        double.tap { |a| expect(a).to receive(:per).with(5) }
      end
    end

    it { expect { subject.send :collection }.to_not raise_error }
  end

  describe '#resource' do
    before { expect(subject).to receive(:params).and_return({ id: 1 } ) }

    before { expect(Category).to receive(:find).with(1) }

    it { expect { subject.send :resource }.to_not raise_error}
  end

end
