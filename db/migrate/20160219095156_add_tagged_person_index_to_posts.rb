class AddTaggedPersonIndexToPosts < ActiveRecord::Migration

  def change
    add_column :posts, :anon_tagged,    :boolean
    add_column :posts, :avatar_tagged,  :boolean
    add_column :posts, :profile_tagged, :boolean
  end

end
