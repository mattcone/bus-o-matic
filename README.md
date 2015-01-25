# Bus-o-matic

[![Code Climate](https://codeclimate.com/repos/54c45d61695680238c000c6f/badges/a02f530f79ad43d83de5/gpa.svg)](https://codeclimate.com/repos/54c45d61695680238c000c6f/feed)
[![Dependency Status](https://gemnasium.com/mattcone/bus-o-matic.svg)](https://gemnasium.com/mattcone/bus-o-matic)
[![Gem Version](https://badge.fury.io/rb/bus-o-matic.svg)](http://badge.fury.io/rb/bus-o-matic)

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

The following examples illustrate how you can use Bus-o-matic.

### Routes and Stops

Bus-o-matic can list all of the routes available. You can also get the 
directions for a particular route, and a list all of the stops on a route.

```ruby

# Retrieve a list of all available routes
PIT::Busomatic.routes

# Retrieve the available directions for the specified route (INBOUND, OUTBOUND, etc.)
PIT::Busomatic.directions :rt => 16

# Retrieve the stops for Route 16 heading Inbound
PIT::Busomatic.stops :rt => 16, :dir => :INBOUND
```

Note that the available directions (INBOUND, etc.) appear to be case sensitive. 

### Patterns

Bus-o-matic can retrieve a set of geo-positional points for a route, something 
known as a "pattern." Patterns can be used to outline routes on maps.

```ruby
# Retrieve the pattern for Route 16
PIT::Busomatic.patterns :rt => 16
```

### Vehicles

Bus-o-matic can find all of the vehicles that are currently active on a route, 
or retrieve information about a specific vehicle. The first step is finding 
the active vehicles on a route.

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

Note that you cannot combine both the `rt` and `vid` parameters in a single 
request.

### Predicted Arrival Times

Bus-o-matic can return predicted arrival times for one or more buses. Up to 10 
vehicle IDs can be specified at once. Note that you cannot combine both `vid` 
and `stpid` parameters in a single request.

```ruby
# Returns predictions for a single vehicle.
PIT::Busomatic.predictions :vid => 5629

# Returns predictions for multiple vehicles. 
PIT::Busomatic.predictions :vid => ["5629","5604"]
```

You can also retrieve predictions for one or more stops. Up to 10 stop IDs can 
be specified at once. You can combine the `stpid` and `rt` parameters, as shown
below.

```ruby

# Returns predictions for all buses on all applicable routes for single stop.
PIT::Busomatic.predictions :stpid => 1326

# Returns predictions for multiple stops.
PIT::Busomatic.predictions :stpid => ["1326","18320","18563"]

# Returns predictions for all buses on Route 16 for a single stop 
PIT::Busomatic.predictions :stpid => 1326, :rt => 16

# Returns predictions for buses on Routes 13, 16, and 17 for Stop 1326.
PIT::Busomatic.predictions :stpid => 1326, :rt => ["13","16","17"]
```

### System Time

Returns the official Port Authority API system time. 

```ruby
PIT::Busomatic.time
```


## Contributing

This is my first Ruby gem, so I'd appreciate you reporting issues or creating 
pull requests. 

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## License

Copyright (c) 2015 Matt Cone and 2013 fbonetti.

The MIT License (MIT). See the LICENSE.txt file for details.