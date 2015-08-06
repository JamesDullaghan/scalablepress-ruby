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

#### Products & Categories

All methods are named after their respective endpoints. The API isn't restful, so some urls are tricky to handle.

```ruby
  # initialize a client with api key
  client = Scalablepress::Client.new(api_key: 'your-api-key-goes-here')

  # List all product categories
  client.products.categories

  # List products (in a category)
  client.products.categories(id: 'sweatshirt')

  # List a specific products information
  client.products.find(id: 'gildan-sweatshirt-crew')

  # List a products availability
  client.products.availability(id: 'gildan-sweatshirt-crew')

  # List detailed item information
  # In order to use this endpoint, you MUST authorize your api key by emailing api@scalablepress.com or you will receive an invalid api key error
  client.products.find_with_details(id: 'gildan-sweatshirt-crew')

  # Retrieve an existing quote
  client.quotes.retrieve(id: orderToken)

  # Create a standard quote
  # TODO: Add example post params!
  client.quotes.standard(params)

  # Create a bulk quote
  # TODO: Add example post params!
  client.quotes.bulk(params)

  # Place an order
  client.order.place_order(params)

  # Reprint an existing order
  client.order.reprint(id: orderId)

  # Retrieve all existing orders
  client.order.retrieve

  # Retrieve a specific existing order
  client.order.retrieve(id: orderId)

  # Order Status
  client.order.status(id: orderId)

  # Order Events
  client.order.events(id: orderId)

  # Change order address
  client.order.change_address(params)

  # Cancel order
  client.order.cancel(id: orderId)

  # All orders that have been shipped and returned
  client.reship.retrieve

  # Specific order that has been shipped and returned
  client.reship.retrieve(id: reshipId)

  # Place a reship order
  client.reship.request(id: reshipId)

  # Cancel a reship order
  client.reship.cancel(id: reshipId)

  # Create a design object
  client.designs.create(params)

  # Resize a design object
  # There are specific rules to follow in order to resize a screenprint design
  # Please see the docs for more information
  # https://scalablepress.com/docs/#resize
  client.designs.resize(params)

  # Retrieve a design object
  client.designs.retrieve(id: designId)

  # Delete a design
  client.designs.delete(id: designId)
```

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
