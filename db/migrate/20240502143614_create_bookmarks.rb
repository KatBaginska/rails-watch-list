class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.belongs_to :movie, null: false, foreign_key: true
      t.belongs_to :list, null: false, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
