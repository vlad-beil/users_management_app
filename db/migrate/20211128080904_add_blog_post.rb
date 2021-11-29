class AddBlogPost < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_posts do |t|
      t.belongs_to :user
      t.string :title
      t.text :post
      t.text :img
      
      t.timestamps
    end
  end
end
