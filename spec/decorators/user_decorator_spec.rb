require 'rails_helper'

RSpec.describe UserDecorator do
  describe '#as_json' do
    let(:user) { stub_model User, first_name: 'Bob', last_name: 'Marley', email: 'test@test.com' }

    subject { user.decorate.as_json }

    its([:full_name]) {should eq 'Bob Marley'}

    its([:email]) { should eq 'test@test.com'}
  end
end
