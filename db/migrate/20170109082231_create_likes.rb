class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end