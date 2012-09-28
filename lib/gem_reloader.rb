require "gem_reloader/version"

module GemReloader

  # All local gems (that is, ones which have a :path attribute)
  # will be automatically reloaded on each request.
  #
  # Add something like 'GemReloader.watch_all!' to your development.rb.
  def self.watch_all!
    reloadable_gems.each do |gem|
      watch gem[:name]
    end
  end
  
  # Watch a specific gem.
  # Add something like 'GemReloader.watch :my_gem' to your development.rb.
  def self.watch(gem_symbol)
    
    gem_path = gem_symbol.to_s
    klass = gem_path.classify
    
    app = Object.const_get(Rails.application.class.parent_name)
    app::Application.configure do
    
      ActionDispatch::Callbacks.to_prepare do
        
        # This code (slightly modified) comes almost entirely from
        # Tim Cardenas - http://timcardenas.com/automatically-reload-gems-in-rails-327-on-eve

        # If the gem's top level module is currently loaded, unload it
        if Object.const_defined?(klass)
          Object.send(:remove_const, klass)
        end

        # Instruct ruby to "unrequire" all of the gems files.
        # CAREFUL: make sure this only matches your gems files.
        $".delete_if {|s| s.include?(gem_path)}

        # Re-require your gem 
        # Note: because we removed all files previously required they will be reloaded
        # even if you didn't use load/autoload in your gem.
        require gem_path

      end
      
    end
  end
  
  private
  
  PATH_REGEX = /^gem[\(| ]['"](\w+)['"][|,](?:.*)path[ =>\:]+['"]([\w\/]+)['"]/
  
  def self.reloadable_gems
    Array.new.tap do |gems|
      File.open(Rails.root.join('Gemfile'), 'rb').each do |ln|
        matches = ln.match(PATH_REGEX)
        if matches
          gems << {name: matches[1], path: matches[2]}
        end
      end
    end
  end
  
end
