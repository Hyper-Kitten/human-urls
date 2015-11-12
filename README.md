Human URLs
===========

Human URLs is an intentionally simple and straight forward way to add slugs to a Rails application.

Because of its simplicity Human URLs currently does not have an option to store a history of changed slugs. If you are looking for this functionality, check out [FriendlyId](http://github.com/norman/friendly_id "Friendly ID").

Install
-------

Human URLs is a Rails engine tested against Rails >= 4.1 and Ruby >= 2.0.0. To get started, add Human URLs to your Gemfile and bundle install.

`gem 'human_urls`

Use
---

### Basic Use

Human URLs stores the slugs in the DB so we'll need to generate a migration to add the slugs to the model. Generate a migration that adds the following:

```ruby
class AddSlugToPost< ActiveRecord::Migration
  def change
    add_column :posts, :slug, :string
    add_index :posts, :slug, unique: true
  end
end
```

You can see we add a string column for the slug to be stored and then we index it since it will be unique.

Alternatively you can just use the generator to do this for you:

```
rails generate slug_migration Post
```

Once the DB is ready include the HumanUrls::Sluggable module in your model and call the 'sluggify':

```ruby
class Post < ActiveRecord::Base
  include HumanUrls::Sluggable
  sluggify
end
```

Lastly, you'll just want to make an interface on the view layer so you can create your slugs.

### Auto Slugs

If you choose you can specify a column to generate a slug from:

```ruby
class Post < ActiveRecord::Base
  include HumanUrls::Sluggable
  sluggify :slug, generated_from: :title
end
```

This will automagically generate a slug from the title, if no slug is specified.
### In the Controller

Finding your model in the controller will be a little different. Instead of finding the model by the ID, you'll need to find the model by the slug:

```ruby
def show
  @post = Post.find_by_slug!(params[:id])
end
```
