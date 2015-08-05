# Scalablepress Ruby Bindings
[![Circle CI](https://circleci.com/gh/JamesDullaghan/scalablepress-ruby.svg?style=svg)](https://circleci.com/gh/JamesDullaghan/scalablepress-ruby)

## Installation

You don't need this source code unless you want to modify the gem. If you just want to use the Stripe Ruby bindings, you should run:

```ruby
  gem install scalablepress-ruby
```

if you want to build the gem from source:

```ruby
  gem build scalablepress-ruby.gemspec
```

Add this line to your application's Gemfile:

```ruby
gem 'scalablepress-ruby'
```

### Bundler

If you are installing via bundler, you should be sure to use the https rubygems source in your Gemfile, as any gems fetched over http could potentially be compromised in transit and alter the code of gems fetched securely over https:

```ruby
  source 'https://rubygems.org'
```

## Usage

TODO: Write usage instructions here

## Documentation

**link to docs goes here...**

### Development

Test cases can be run with:

```powershell
  bundle exec rake test
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/scalablepress-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
