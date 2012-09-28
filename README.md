# GemReloader

Stop restarting your server after editing local gems!

## Usage

In your `development.rb`, add:

    GemReloader.watch :my_gem
    
Or, if you want to watch **all** local gems:

    GemReloader.watch_all!
    
That's literally it. Tiny but useful.

By the way, a gem will be picked up by `::watch_all!` if it has a :path attribute.

## Installation

Add this line to your application's Gemfile:

    gem 'gem_reloader'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gem_reloader

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
