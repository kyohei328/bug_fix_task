class ChangeDataContentToBlogs < ActiveRecord::Migration[5.2]
  def change
    execute 'DELETE FROM blogs;'
    change_column :blogs, :content, :text
  end
end
