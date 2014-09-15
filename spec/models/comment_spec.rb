require 'rails_helper'

RSpec.describe Comment, :type => :model do
  describe 'user_id' do
    context 'nilのとき' do
      let(:comment) { build(:comment, user_id: nil) }
      it 'validでないこと' do
        comment.valid?
        expect(comment.errors[:user_id]).to be_present
      end
    end

    context '0のとき' do
      let(:comment) { build(:comment, user_id: 0) }
      it 'validであること' do
        comment.valid?
        expect(comment.errors[:user_id]).to be_blank
      end
    end
  end

  describe 'post_id' do
    context 'nilのとき' do
      let(:comment) { build(:comment, post_id: nil) }
      it 'validでないこと' do
        comment.valid?
        expect(comment.errors[:post_id]).to be_present
      end
    end
  end

  describe 'content' do
    context 'nilのとき' do
      let(:comment) { build(:comment, content: nil) }
      it 'validでないこと' do
        comment.valid?
        expect(comment.errors[:content_id]).to be_present
      end
    end
  end
end
