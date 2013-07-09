# EventLogger::EventLogger
[![Build Status](https://travis-ci.org/320ny/event_logger.png?branch=master)](https://travis-ci.org/320ny/event_logger)

Event Logger allows you to log events from anywhere in you Rails appliaction.
Once logged these events can be used to run statistics on the types of events logged.
Each event can store a seralized ruby object so you have access to detailed information
regarding your event.

## Installation

Add this line to your application's Gemfile:

    gem 'event_logger'

And then execute:

    $ bundle

Generate the event_logs table migration
    
    $ rake g event_logger

Run the migration

    $ rake db:migrate

## Usage

All controllers have access to the `log_event` method. This method takes two arguments

1. event (string)
2. object (ruby object)

Anytime you wish to track an event use this method. For example if we want to track failed user
signups we would do this

```ruby
class RegistrationsController < ApplicationController
  def create
    ...
    log_event('user_signup_failed', current_user)
    ...
  end
end
```

This will later allow us to run analytics on these events. If we want to know the number of failed 
signups we just need to ask

```ruby
EventLogger::EventLog.where(:event => 'user_signup_failed').count
```

We also have full acess to the objects within the event

```ruby
event = EventLogger::EventLog.where(:event => 'user_signup_failed').last
event.object
=> #<User first_name: "Ryan", last_name: "Howard">
event.object.first_name
=> "Ryan"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
