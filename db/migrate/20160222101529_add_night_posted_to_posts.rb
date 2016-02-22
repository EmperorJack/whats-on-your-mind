class AddNightPostedToPosts < ActiveRecord::Migration

  def change
    add_column :posts, :night_posted, :integer
  end

end
