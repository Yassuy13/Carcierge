require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { build(:post, user_id: user.id) }
  
  subject { test_post.valid? }
  let(:test_post) { post }

  it '空欄でないこと' do
    test_post.title = ''
    test_post.body = ''
    is_expected.to eq false;
  end
end
