class AddUserIdToBrowses < ActiveRecord::Migration[6.1]
  def change
    add_reference :browses, :user, foreign_key: true
    add_reference :browses, :post, foreign_key: true
  end
end
