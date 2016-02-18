class Post < ActiveRecord::Base

  validates_presence_of :message

  scope :latest, -> { order("created_at DESC") }

end
