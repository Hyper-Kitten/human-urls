class Post < ActiveRecord::Base
  include HumanUrls::Sluggable
  sluggify
end
