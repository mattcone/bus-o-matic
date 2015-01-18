# Bus-o-matic

Bus-o-matic is a simple Ruby wrapper for the [Pittsburgh Port Authority API] 
(http://www.portauthority.org/paac/CompanyInfoProjects/DeveloperResources.aspx).

## API Key

Bus-o-matic requires an API key. You can request one from [Port Authority] 
(http://www.portauthority.org/paac/CompanyInfoProjects/DeveloperResources.aspx).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bus-o-matic'
```

Or install it yourself as:

    $ gem install bus-o-matic

## Setup

Your project needs to require Bus-o-matic. This can be put in an initializer.

```ruby
require 'busomatic'

key = "xxxxxxxxxxxxxxxxxxxx"
PIT::Busomatic.key = key
```

## Usage

TODO: Write usage instructions here

## Contributing

This is my first Ruby gem, so I appreciate you reporting issues or creating 
pull requests. 

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## License

See the LICENSE.txt file for details.
