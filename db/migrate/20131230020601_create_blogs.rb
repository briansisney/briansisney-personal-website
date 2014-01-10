class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :date
      t.string :title
      t.text :post
      t.string :image
      t.references :user, index: true

      t.timestamps
    end
  end
end
