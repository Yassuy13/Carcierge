require 'rails_helper'

RSpec.describe Browse, type: :model do
  let(:user) { create(:user) }
  let(:browse) { build(:browse, user_id: user.id) }
  
  subject { test_browse.valid? }
  let(:test_browse) { browse }

  it '空欄でないこと' do
    test_browse.body = ''
    is_expected.to eq false;
  end
end
