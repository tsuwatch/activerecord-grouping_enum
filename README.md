# ActiveRecord::GroupingEnum

Grouping the enum of ActiveRecord

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-grouping_enum'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-grouping_enum

## Usage

```ruby
class Post < ActiveRecord::Base
  enum status: [:editing:, :closed, :published, :deleted, :admin_deleted]
  grouping_enum status: {
    undeleted: [:editing, :closed, :published]
  }
end
```

You can

```ruby
Post.undeleted
```
and
```ruby
Post.undeleted.first.undeleted?
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/activerecord-grouping_enum.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

