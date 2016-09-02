require 'rails_helper'

RSpec.describe LikeObserver, type: :observer do

  subject { described_class.send(:new) }

  let(:like) { stub_model Like }

  describe '#after_create' do
    before { expect(subject).to receive(:add_rating) }
    it { expect{ subject.after_create(like) }.to_not raise_error }
  end

  describe '#after_destroy' do
    before { expect(subject).to receive(:add_rating) }
    it { expect{ subject.after_destroy(like) }.to_not raise_error }
  end


  describe '#add_rating' do
    before { expect(subject).to receive(:add_rating_to_post_and_author) }

    context 'post' do
      before do
        expect(subject).to receive(:like) do
          double.tap do |a|
            expect(a).to receive(:likeable) do
              double.tap { |b| expect(b).to receive(:is_a?)
                                        .with(Comment).and_return false }
            end
          end
        end
      end
      it { expect{ subject.send(:add_rating) }.to_not raise_error }
     end

     context 'comment' do
       before do
         expect(subject).to receive(:like) do
           double.tap do |a|
             expect(a).to receive(:likeable) do
               double.tap { |b| expect(b).to receive(:is_a?)
                                         .with(Comment).and_return true }
             end
           end
         end
       end
       before { expect(subject).to receive(:add_rating_to_comment_and_user) }
       it { expect{ subject.send(:add_rating) }.to_not raise_error }
     end
   end


  describe '#add_rating_to_comment_and_user' do
    before { expect(subject).to receive(:rating_value).twice.and_return 1  }
    before do
      expect(subject).to receive(:like) do
        double.tap do |a|
          expect(a).to receive(:likeable) do
            double.tap { |b| expect(b).to receive(:increment!).with(:rating, 1) }
          end
        end
      end
    end

    before do
      expect(subject).to receive(:like) do
        double.tap do |a|
          expect(a).to receive(:likeable) do
            double.tap do |b|
              expect(b).to receive(:user) do
                double.tap { |c| expect(c).to receive(:increment!).with(:rating, 1) }
              end
            end
          end
        end
      end
    end
    it { expect{ subject.send(:add_rating_to_comment_and_user) }.to_not raise_error }
    end


    describe '#add_rating_to_post_and_author' do
    let(:post) { stub_model Post }
    before { expect(subject).to receive(:post).twice.and_return(post) }
    before { expect(subject).to receive(:rating_value).twice.and_return 1  }
    before {expect(post).to receive(:increment!).with(:rating, 1) }
    before do
      expect(post).to receive(:author) do
        double.tap { |a| expect(a).to receive(:increment!).with(:rating, 1) }
      end
    end
    it { expect{ subject.send(:add_rating_to_post_and_author) }.to_not raise_error }
  end



  describe '#rating_value' do
    context 'positive' do
      before { expect(subject).to receive(:coef).and_return(1) }
      before do
        expect(subject).to receive(:like) do
          double.tap { |a| expect(a).to receive(:positive?).and_return true }
        end
      end
      it { (subject.send(:rating_value)).should eq Like::POSITIVE_VALUE }
    end

    context 'negative' do
      before { expect(subject).to receive(:coef).and_return(1) }
      before do
        expect(subject).to receive(:like) do
          double.tap { |a| expect(a).to receive(:positive?).and_return false }
        end
      end
      it { (subject.send(:rating_value)).should eq Like::NEGATIVE_VALUE }
    end
  end


  describe '#post' do
    context 'comment' do
      before do
        expect(subject).to receive(:like) do
          double.tap do |a|
            expect(a).to receive(:likeable) do
              double.tap { |b| expect(b).to receive(:is_a?).with(Comment)
                                                           .and_return true }
            end
          end
        end
      end
      before do
        expect(subject).to receive(:like) do
          double.tap do |a|
            expect(a).to receive(:likeable) do
              double.tap { |b| expect(b).to receive(:post) }
            end
          end
        end
      end
      it { expect { subject.send(:post) }.to_not raise_error }
    end
    context 'post' do
      before do
        expect(subject).to receive(:like) do
          double.tap do |a|
            expect(a).to receive(:likeable) do
              double.tap { |b| expect(b).to receive(:is_a?).with(Comment)
                                                           .and_return false }
            end
          end
        end
      end

      before do
        expect(subject).to receive(:like) do
          double.tap { |a| expect(a).to receive(:likeable) }
        end
      end
      it { expect { subject.send(:post) }.to_not raise_error }
    end
  end
end
