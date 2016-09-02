require 'rails_helper'

RSpec.describe Api::PostsController, type: :controller do
  it { should route(:get, 'api/posts').to(action: :index) }

  # it { should route(:get, 'api/categories/1/posts').to(action: :index) }

  it { should route(:get, 'api/posts/1').to(action: :show, id: 1) }

  # it { should route(:get, 'api/categories/1/posts/1').to(action: :show, id: 1) }


  it { should route(:post, 'api/categories/1/posts').to(action: :create) }

  it { should route(:patch, 'api/posts/1').to(action: :update, id: 1) }

  it { should route(:put, 'api/posts/1').to(action: :update, id: 1) }

  # it { should route(:delete, 'api/posts/1').to(action: :destroy, id: 1) }

  #
  # describe '#create.json' do
  #   before { expect(subject).to receive(:build_resource) }
  #
  #   before do
  #     expect(subject).to receive(:resource) do
  #       double.tap { |a| expect(a).to receive(:save!) }
  #     end
  #   end
  #
  #   before { post :create, category: { title: 'bar' }, format: :json }
  #
  #   it { expect(response).to have_http_status(:created) }
  # end
  #
  # describe '#build_resource' do
  #   # @user = Category.new resource_params
  #   let(:params) { { foo: :bar } }
  #
  #   before { expect(subject).to receive(:resource_params).and_return params }
  #
  #   before { expect(Category).to receive(:new).with(params) }
  #
  #   it { expect { subject.send(:build_resource) }.to_not raise_error }
  # end
  #
  # describe '#collection' do
  #   let(:params) { { page: 5 } }
  #
  #   before { expect(subject).to receive(:params).and_return(params) }
  #
  #   before do
  #     expect(Category).to receive(:page).with(5) do
  #       double.tap { |a| expect(a).to receive(:per).with(5) }
  #     end
  #   end
  #
  #   it { expect { subject.send :collection }.to_not raise_error }
  # end
  #
  # describe '#resource' do
  #   before { expect(subject).to receive(:params).and_return({ id: 1 } ) }
  #
  #   before { expect(Category).to receive(:find).with(1) }
  #
  #   it { expect { subject.send :resource }.to_not raise_error}
  # end

end
