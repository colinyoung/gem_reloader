# GemReloader

Stop restarting your server after editing local gems!

## Usage

In your `development.rb`, add:

    GemReloader.watch :my_gem
    
Or, if you want to watch **all** local gems:

    GemReloader.watch_all!
    
That's literally it. Tiny but useful.

**Important Note**:

> If your gems are in irregular directories (directories that aren't in your `autoload_paths`), you'll need to add those paths in your `application.rb`. GemReloader will automatically add `vendor/gems` to the autoload_paths for you.

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

## Changelog

- v0.0.2: Added "vendor/gems" to the config.autoload_paths so the user doesn't have to.
