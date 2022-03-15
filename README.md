# GaleShapley

This gem provide a basic algorithm to solve 'stable marriage problem', finding a stable matching between two equally sized sets of elements given an ordering of preferences for each element.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gale_shapley'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install gale_shapley

## Usage

```ruby
proposers_ranks = {
  '1': ['a', 'b', 'c', 'd'],
  '2': ['c', 'b', 'a', 'd'],
  '3': ['a', 'b', 'd', 'c'],
  '4': ['c', 'a', 'd', 'b'],
}
acceptors_ranks = {
  'a': ['1', '2', '3', '4'],
  'b': ['2', '1', '4', '3'],
  'c': ['2', '3', '1', '4'],
  'd': ['1', '4', '3', '2'],
}
GaleShapley.resolve(proposers_ranks, acceptors_ranks)
#=> {"1"=>"a", "2"=>"c", "3"=>"b", "4"=>"d"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mrbigass/gale_shapley. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mrbigass/gale_shapley/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GaleShapley project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mrbigass/gale_shapley/blob/master/CODE_OF_CONDUCT.md).
