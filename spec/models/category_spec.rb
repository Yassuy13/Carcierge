require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  let(:category) { build(:category, user_id: user.id) }
  
  subject { test_category.valid? }
  let(:test_category) { category }

  it '空欄でないこと' do
    test_category.name = ''
    is_expected.to eq false;
  end
end
