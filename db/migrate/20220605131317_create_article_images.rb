class CreateArticleImages < ActiveRecord::Migration[6.1]
  def change
    create_table :article_images do |t|
      t.string :image
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
