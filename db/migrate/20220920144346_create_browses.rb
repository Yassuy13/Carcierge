class CreateBrowses < ActiveRecord::Migration[6.1]
  def change
    create_table :browses do |t|
      t.text :body, null: false
      t.string :car_image_id

      t.timestamps
    end
  end
end
