require 'test_helper'

class SluggableTest < ActiveSupport::TestCase
  test "validates presence of slug" do
    exp = assert_raises { Post.create! }
    assert_match(/Validation failed: Slug can't be blank/, exp.message)
  end

  test "validates unqiueness of slug" do
    Post.create!(slug: "slug")
    exp = assert_raises { Post.create!(slug: "slug") }
    assert_match(/Slug has already been taken/, exp.message)
  end

  test "validates unqiueness of slug and isn't case sensitive" do
    Post.create!(slug: "Slug")
    exp = assert_raises { Post.create!(slug: "slug") }
    assert_match(/Slug has already been taken/, exp.message)
  end

  test "slug properly formats string to slug friendly format" do
    post = Post.create!(slug: "This i$ my SLUG")

    assert_match("this-i-my-slug", post.slug)
  end

  test "#to_param returns the slug" do
    post = Post.create!(slug: "slug")

    assert_match("slug", post.to_param)
  end

  test ".sluggify can generate slug from given attribute" do
    taggable = TaggableWGeneratedSlug.create!(title: "My Title")

    assert_match("my-title", taggable.slug)
  end
end
