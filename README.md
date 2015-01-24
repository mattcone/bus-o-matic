# Bus-o-matic

Bus-o-matic is a simple Ruby wrapper for the [Pittsburgh Port Authority API] 
(http://www.portauthority.org/paac/CompanyInfoProjects/DeveloperResources.aspx).
This gem allows you to retrieve real-time information about vehicles, routes, 
stops, and predicted arrival times for buses in Pittsburgh, Pennsylvania.
This gem borrows heavily from [cta-api] (https://github.com/fbonetti/cta-api)
by [Frank Bonetti] (https://github.com/fbonetti). 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bus-o-matic'
```

## Setup

Before using Bus-o-matic, you'll need to request an API key from the [Port 
Authority] (http://www.portauthority.org/paac/CompanyInfoProjects/DeveloperResources.aspx). 
Require the gem and add your Port Authority API key. This can be put in an initializer.

```ruby
require 'bus-o-matic'

key = "xxxxxxxxxxxxxxxxxxxx"
PIT::Busomatic.key = key
```

## Usage

The following examples illustrate how Bus-o-matic can be used to interact with 
the Port Authority API.

### Routes and Stops

```ruby
# Retrieve the stops for Route 16 heading Inbound.
PIT::Busomatic.stops :rt => 16, :dir => :INBOUND
```

### Vehicles

You can use Bus-o-matic to find all of the vehicles that are currently active 
on a route, or retrieve information about a specific vehicle. The first step is
finding the active vehicles on a route.

```ruby
# Returns an array of vehicles that are active on Route 16.
PIT::Busomatic.vehicles :rt => 16
```

You can retrieve information for vehicles on more than one route. Up to 10 
routes can be specified at once.

```ruby
# Returns an array of vehicles that are active on Routes 13, 16, and 17.
PIT::Busomatic.vehicles :rt => ["16","17","13"]
```

You can also find information about one or more vehicles that are currently
active. Up to 10 vehicle IDs can be specified at once.

```ruby
# Returns information about a specific vehicle.
PIT::Busomatic.vehicles :vid => 6013

# Returns information about multiple vehicles.
PIT::Busomatic.vehicles :vid => ["6013","6001"]
```

Note that you cannot combine both `rt` and `vid` in a single request.

### Predicted Arrival Times

### System Time

Returns the official Port Authority API system time. 

```ruby
PIT::Busomatic.time
```


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
