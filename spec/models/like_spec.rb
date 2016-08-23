require 'rails_helper'

RSpec.describe Like, type: :model do

  it { should belong_to(:user) }

  it { should belong_to(:likeable) }

  # it { should validate_presence_of :kind }

  it do
    should define_enum_for(:kind).
    with([:positive, :negative])
  end

  # it { should validate_uniqueness_of(:user_id).scoped_to(:likeable_id, :likeable_kind) }

end
