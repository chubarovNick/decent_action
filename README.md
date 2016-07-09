[![Build Status](https://travis-ci.org/chubarovNick/decent_action.svg?branch=master)](https://travis-ci.org/chubarovNick/decent_action)
[![Code Climate](https://codeclimate.com/github/chubarovNick/decent_action/badges/gpa.svg)](https://codeclimate.com/github/chubarovNick/decent_action)
[![Issue Count](https://codeclimate.com/github/chubarovNick/decent_action/badges/issue_count.svg)](https://codeclimate.com/github/chubarovNick/decent_action)
[![Test Coverage](https://codeclimate.com/github/chubarovNick/decent_action/badges/coverage.svg)](https://codeclimate.com/github/chubarovNick/decent_action/coverage)

# DecentAction

Gem inspired Interactor approach of building application logic and declarative contract from Trailblazer operation gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'decent_action'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install decent_action

## Usage

# Contract

Contract is declarative presentation of input data with validations. Definnig example:

```ruby

class Foo < DecentAction::Base

  contract do
    attribute :title, String
    validates :title, presence: true

    object :user do
      attribute :name, String
      validates :name, presence: true
    end

    collection :contacts do
      attribute :first_name, String
      attribute :last_name, String

      validates :first_name, :last_name, presence: true
    end
  end

  def perform
    #your application logic
  end

end
```
Each `object` and `collection` block is nested objects with their own validations

# Run action

Module ` DecentAction::Controller::RunAction` provide instance method `run(<action_class>, <action_params>)`.

Include it in Rails controller or som other request handler place

```ruby
include DecentAction::Controller::RunAction
```

after that in controller available method `run`

```ruby
run Foo, {title: 'Title', user: {name: 'User name'}}
```

# Configuration

```
DecentAction.configure do |config|
  config.actor :user # Method which will be used for authentication block
  config.use MyWrapper # Append wrapper to the end of wrappers list
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/decent_action. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

