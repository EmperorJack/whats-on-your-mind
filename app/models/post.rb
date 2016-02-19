class Post < ActiveRecord::Base

  scope :latest,  -> { order("created_at DESC") }
  scope :anon,    -> { where(anon_tagged: true) }
  scope :avatar,  -> { where(avatar_tagged: true) }
  scope :profile, -> { where(profile_tagged: true) }

  validates_presence_of :message

  after_create :extract_hashed_persons

  def extract_hashed_persons
    ["anon", "avatar", "profile"].each_with_index do |person, index|
      if message.match(/##{person}/)
        update_attribute("#{person}_tagged".to_sym, true)
      end
    end
  end

end
