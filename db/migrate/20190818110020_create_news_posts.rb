class CreateNewsPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :news_posts do |t|
      t.string :title
      t.text :text
      t.string :image
      t.date :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
