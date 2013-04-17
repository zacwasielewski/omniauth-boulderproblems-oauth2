# OmniAuth Boulder Problems

Boulder Problems OAuth2 Strategy for OmniAuth 1.0.

**NOTE: Probably not useful unless you plan on using boulderproblems.com as an oAuth authentication provider!**

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-boulderproblems-oauth2'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::Boulderproblems` is simply a Rack middleware. Read the OmniAuth 1.0 docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :boulderproblems, ENV['BOULDERPROBLEMS_API_KEY'], ENV['BOULDERPROBLEMS_SHARED_SECRET']
end
```