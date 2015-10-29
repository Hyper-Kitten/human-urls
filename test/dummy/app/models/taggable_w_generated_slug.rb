class TaggableWGeneratedSlug < ActiveRecord::Base
  include HumanUrls::Sluggable
  sluggify :slug, generated_from: :title
end
