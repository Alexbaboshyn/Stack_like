require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }

  it { should validate_presence_of :is_admin}

  it { should validate_presence_of :first_name }

  it { should validate_presence_of :last_name }

  it { should validate_presence_of :email }

  it { should validate_uniqueness_of(:email).case_insensitive }

  it { should_not allow_value('test').for(:email) }

  it { should allow_value('test@test.com').for(:email) }

  it { should validate_uniqueness_of(:token)}

  it { should have_many(:posts).dependent(:destroy) }

  it { should have_many(:comments).dependent(:destroy) }

  it { should have_many(:likes).dependent(:destroy) }
end