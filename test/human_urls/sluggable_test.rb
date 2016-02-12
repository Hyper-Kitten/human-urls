require 'test_helper'

class SluggableTest < ActiveSupport::TestCase

  # Two models used for testing can be found in the dummy app
  # test/dummy/app/models
  #
  # class Taggable < ActiveRecord::Base
  #   include HumanUrls::Sluggable
  #   sluggify
  # end
  #
  # class TaggableWGeneratedSlug < ActiveRecord::Base
  #   include HumanUrls::Sluggable
  #   sluggify :slug, generated_from: :title
  # end

  test "validates presence of slug" do
    exp = assert_raises { Taggable.create! }
    assert_match(/Validation failed: Slug can't be blank/, exp.message)
  end

  test "validates unqiueness of slug" do
    Taggable.create!(slug: "slug")
    exp = assert_raises { Taggable.create!(slug: "slug") }
    assert_match(/Slug has already been taken/, exp.message)
  end

  test "validates unqiueness of slug and isn't case sensitive" do
    Taggable.create!(slug: "Slug")
    exp = assert_raises { Taggable.create!(slug: "slug") }
    assert_match(/Slug has already been taken/, exp.message)
  end

  test "slug properly formats string to slug friendly format" do
    taggable = Taggable.create!(slug: "This i$ my SLUG")

    assert_match("this-i-my-slug", taggable.slug)
  end

  test "slug properly updates an existing slug when auto generated" do
    taggable = TaggableWGeneratedSlug.
      create!(title: "my-title", slug: "my-old-slug")
    taggable.update!(slug: "my-new-slug")

    assert_match("my-new-slug", taggable.slug)

    taggable.update!(slug: "")

    assert_match("my-title", taggable.slug)
  end

  test "slug does not update an existing slug when source field changes" do
    taggable = TaggableWGeneratedSlug.
      create!(title: "my-title", slug: "my-old-slug")
    taggable.update!(title: "Changed Title")

    assert_match("my-old-slug", taggable.slug)
  end

  test "#to_param returns the slug" do
    taggable = Taggable.create!(slug: "slug")

    assert_match("slug", taggable.to_param)
  end

  test ".sluggify can generate slug from given attribute" do
    taggable = TaggableWGeneratedSlug.create!(title: "My Title")

    assert_match("my-title", taggable.slug)
  end
end
