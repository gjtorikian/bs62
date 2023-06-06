# Bs62

Quick and easy Base62 encoder and decoder. The difference between this gem and many others is that it operates on an
array of bytes.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add bs62

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install bs62

## Usage

Call `encode` to encode an array of bytes into Base62:

```ruby
require "bs62"

bytes = SecureRandom.hex(4).bytes # [99, 56, 97, 54, 57, 101, 54, 97]

Bs62.encode(bytes) # "jY45tzXOpUU"
```

Similarly, call `decode` to convert a Base62 string to an array of bytes:

```ruby
require "bs62"

str = "jY45tzXOpUU"

Bs62.decode(str) # [99, 56, 97, 54, 57, 101, 54, 97]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake compile test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and merge that change into `main`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gjtorikian/bs62.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
