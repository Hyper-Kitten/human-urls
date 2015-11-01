class Taggable < ActiveRecord::Base
  include HumanUrls::Sluggable
  sluggify
end
