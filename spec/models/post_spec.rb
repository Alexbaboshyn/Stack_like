require 'rails_helper'

RSpec.describe Post, type: :model do

  it { should validate_presence_of :title }

  it { should validate_presence_of :description }

  it { should belong_to(:author) }

  it { should belong_to(:category) }

  it { should validate_numericality_of(:rating) }

  it { should have_many(:likes).dependent(:destroy) }

  it { should have_many(:comments).dependent(:destroy) }

end
