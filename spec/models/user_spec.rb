require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  
  it '正常に作成できること' do
    expect { user.save }.to change(User, :count).by(1)
  end

  it '正常に削除できること' do
    user.save
    expect { user.destroy! }.to change(User, :count).by(-1)
  end

  it "nameが空欄の場合、無効になること" do
    user = User.create(name: nil)
    expect(user).to be_invalid
  end
end
