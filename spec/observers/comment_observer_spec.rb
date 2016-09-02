require 'rails_helper'

RSpec.describe CommentObserver, type: :observer do

  subject { described_class.send(:new) }

  let(:comment) { stub_model Comment }

  describe '#after_create' do
    before do
      expect(comment).to receive(:post) do
        double.tap { |b| expect(b).to receive(:increment!)
                                  .with(:rating, Comment::COMMENT_CONSTANT) }
      end
    end
    it { expect{ subject.after_create(comment) }.to_not raise_error }
  end

  describe '#after_destroy' do
    before do
          expect(comment).to receive(:post) do
            double.tap { |b| expect(b).to receive(:decrement!)
                                       .with(:rating, Comment::COMMENT_CONSTANT) }
      end
    end
    it { expect{ subject.after_destroy(comment) }.to_not raise_error }
  end



  end




















#
