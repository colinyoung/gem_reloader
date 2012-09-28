# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gem_reloader/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Colin Young"]
  gem.email         = ["me@colinyoung.com"]
  gem.description   = %q{Stop restarting your server after editing local gems}
  gem.summary       = %q{With GemReloader, watch local gems just like you do your models and controllers.}
  gem.homepage      = "https://github.com/colinyoung/gem_reloader"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gem_reloader"
  gem.require_paths = ["lib"]
  gem.version       = GemReloader::VERSION
end
