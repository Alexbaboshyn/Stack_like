require 'rails_helper'

RSpec.describe Comment, type: :model do

  it { should validate_presence_of :text }

  it { should belong_to(:user) }

  it { should belong_to(:post) }

  it { should have_many(:likes).dependent(:destroy) }

end
