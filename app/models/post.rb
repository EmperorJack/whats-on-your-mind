class Post < ActiveRecord::Base

  scope :latest,  -> { order("created_at DESC") }
  scope :anon,    -> { where(anon_tagged: true) }
  scope :avatar,  -> { where(avatar_tagged: true) }
  scope :profile, -> { where(profile_tagged: true) }
  scope :tonight, -> { where(night_posted: Raster::Application::CURRENT_NIGHT) }

  validates_presence_of :message

  after_create :extract_hashed_persons, :assign_night_posted

  def extract_hashed_persons
    ["anon", "avatar", "profile"].each_with_index do |person, index|
      if message.downcase.match(/##{person}/)
        update_attribute("#{person}_tagged".to_sym, true)
      else
        update_attribute("#{person}_tagged".to_sym, false)
      end
    end
  end

  def assign_night_posted
    update_attribute(:night_posted, Raster::Application::CURRENT_NIGHT)
  end

end
