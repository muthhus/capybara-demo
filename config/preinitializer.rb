# This is how the bundler website recommends you do it, but it doesn't work.

# # Bundler support
# begin
#   require "rubygems"
#   require "bundler"
# 
#   if Gem::Version.new(Bundler::VERSION) <= Gem::Version.new("0.9.5")
#     raise RuntimeError, "Your bundler version is too old." +
#      "Run `gem install bundler` to upgrade."
#   end
# 
#   # Set up load paths for all bundled gems
#   Bundler.setup
# rescue Bundler::GemNotFound
#   raise RuntimeError, "Bundler couldn't find some gems." +
#     "Did you run `bundle install`?"
# end

# bundler 0.9.x support that actually works, see: http://andre.arko.net/2010/02/13/using-bundler-09-with-rails-235/
begin
  # Require the preresolved locked set of gems.
  require File.expand_path('../../.bundle/environment', __FILE__)
rescue LoadError
  # Fallback on doing the resolve at runtime.
  require "rubygems"
  require "bundler"
  if Gem::Version.new(Bundler::VERSION) <= Gem::Version.new("0.9.5")
    raise RuntimeError, "Bundler incompatible.\n" +
      "Your bundler version is incompatible with Rails 2.3 and an unlocked bundle.\n" +
      "Run `gem install bundler` to upgrade or `bundle lock` to lock."
  else
    Bundler.setup
  end
end
