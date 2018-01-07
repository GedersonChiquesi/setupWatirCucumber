# SetupWatirCucumber

A gem for setup BDD automation with [Cucumber](https://github.com/cucumber/cucumber) and [Watir](https://github.com/watir/watir) Framework

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'setupWatirCucumber'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install setupWatirCucumber

## Usage

After instalation then execute:

```
    $ setupWatirCucumber create --from "./"
```

This command will configure the cucumber, will configure the env and hooks and finally create a scenario to test the installation

Now execute:

```
    $ cucumber -p html_report
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/GedersonChiquesi/setupWatirCucumber. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SetupWatirCucumber project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/GedersonChiquesi/setupWatirCucumber/blob/master/CODE_OF_CONDUCT.md).
