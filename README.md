# Rails 6 Site Template

#### Ruby 2.7.1 | Rails 6.0.2.2

This template is a base starting point for a modern Ruby on Rails version 6
application. Utilizing Webpacker, Stimulus, Stimulus Reflex, and many helpful
quick start features. It is also fully docker compatible.

## Template information

###### TODO:
- Add information on default flash settings

### Stimulus and Stimulus Reflex
Keeping up with modern javascript frameworks is pretty crazy, Stimulus and
Stimulus Reflex give you a lot of powerful real-time rendering that fits with
rails.

###### TODO:
- `checkbox/index.js`
- `scrollable/index.js`
- `smooth_anchor/index.js`

### Foundation and Tailwind
This template uses [Foundation Sites v6](https://get.foundation/sites/docs/) and [TailwindCSS](https://tailwindcss.com/) for rapid prototyping.

#### Foundation
Current Version: `6.6.3`

Settings can be found in
- `./app/javascript/foundation/_settings.scss`
- `./app/javascript/foundation/foundation_and_overrides.scss`

#### Tailwind
Current Version: `1.2.0`

Settings can be found in `./app/javascript/tailwind/tailwind.js`

### Application Version Tracking
Included is a powerful and easy to use semantic versioning rake file that will
assist you in keeping track of the version number of your application.
`lib/tasks/version.rake` providies some simple commands to manage your
`./VERSION` file which contains a version number similar to `major.minor.tiny.pre`
eg. `1.2.3.rc1`. The `pre` is able to consist of any text string. `major`, `minor`,
and `tiny` must be integers.

```ruby
# Prints you a list of commands available
=> bundle exec rake version

Available commands are:
-----------------------
bundle exec rake version:write[version] # set custom version in the x.x.x.pre format
bundle exec rake version:pre[flag]      # set pre with flag x.x.x.flag
bundle exec rake version:tiny           # increment tiny and reset pre x.x.x+1
bundle exec rake version:minor          # increment minor and reset tiny x.x+1.0
bundle exec rake version:major          # increment major and reset others x+1.0.0
```

Or you may change the `./VERSION` file manually with whatever version you wish.
Just note the rake tasks will not work unless you follow the major, minor, tiny
pre formatting.

## Docker

### Quickstart

1. build application with `docker-compose build app`
2. start your application in docker with `docker-compose up`
3. in a new terminal run `docker-compose exec app rake db:create db:migrate`

### Bundler and Ruby Gems

After building the initial application, any gem changes must be followed by
`docker-compose run --rm app bundle`. This will properly update the gems within
the `gem` volume used as a cache for the application's gems.

### Potential issues

- Application missing application-xyz123.js and no CSS or JS rendering. (Commonly happens after restarts)
  - delete your `./public/packs` folder and allow webpacker to re-build the assets


## Included Non Standard Gems

###### TODO:
- Clean up list of gems

### [Annotate](https://github.com/ctran/annotate_models "Annotate")
run `annotate` to quickly add helpful annotations to models, and specs

### [Decent Exposure](https://github.com/hashrocket/decent_exposure "Decent Exposure")
A gem that helps keep controllers concise and easy to read.

### [Enumerations](https://github.com/infinum/enumerations)
Better enumerations for rails

### [Interactor](https://github.com/collectiveidea/interactor)
Interactor provides a common interface for performing complex user interactions.

### [Modernizer](https://github.com/russfrisch/modernizr-rails "Modernizer")
Modernizer for easy access to what web technologies are available to the browser

### [Greensock](https://github.com/robertpataki/greensock-rails "Greensock")
Greensock for awesomely powerful animations

### [Devise](https://github.com/plataformatec/devise "Devise")
For user authentication

### [Pundit](https://github.com/varvet/pundit "Pundit")
For permission and authorization

### [Postgres](https://github.com/ged/ruby-pg "Postgres")
This template uses Postgres everywhere by default, to keep your production and development environments as close as possible. Check out the gem page for info on how to set up Postgres if you're having trouble. Check out the Postgres.app for OSX if you want a super easy Postgres setup!

### [Fog AWS](https://github.com/fog/fog-aws "Fog AWS")
The fog_aws gem is for connecting and storing files via Amazon S3, a very affordable and powerful storage option.

### [Remotipart](https://github.com/JangoSteve/remotipart "Remotipart")
A gem that adds AJAX file upload capabilities to Rails

### [Nested Form Fields](https://github.com/ncri/nested_form_fields "Nested Form Fields")
A gem that dynamically adds and removes nested has_many associations fields

### [Simple Form](https://github.com/plataformatec/simple_form "Simple Form")
A gem that makes rails forms well... Simple. Very powerful tool that is setup to make use of foundation framework for quick and easy beautiful functional forms.

### [Client Side Validations](https://github.com/DavyJonesLocker/client_side_validations "Client Side Validations")
A gem that dynamically adds client side validations to Rails Forms based on your model validations.

### [Browser](https://github.com/fnando/browser "Browser")
Get browser information in your server from the agent string of the requests. This allows you to check within views and controllers for things like mobile devices and remove heavy content such as videos in such a case.

### [Airbrake](https://github.com/airbrake/airbrake "Airbrake")
For monitoring errors within your application

### [Newrelic](https://github.com/newrelic/rpm "Newrelic")
For monitoring application performance

### [CSS Splitter](https://github.com/zweilove/css_splitterhttp:// "CSS Splitter")
Gem for splitting up stylesheets that go beyond the IE limit of 4095 selectors, for Rails 3.1+ apps using the Asset Pipeline.

### [Byebug](https://github.com/deivid-rodriguez/byebug "Byebug")
For real time in line code testing

### [Figaro](https://github.com/laserlemon/figaro "Figaro")
A gem that adds environment variables to your development environment.

### [Letter Opener](https://github.com/ryanb/letter_opener "Letter Opener")
Change your development environment to open mailers in a browser window rather than sending

### [Factory Bot Rails](https://github.com/thoughtbot/factory_bot "Factory Bot")
A library for setting up ruby objects for test data

### [Faker](https://github.com/stympy/faker "Faker")
A library for generating fake data, great to use with Factory Bot

### [Rspec](https://github.com/rspec/rspec-rails "Rspec")
A testing library that is much more readable than the default rails testing

### [Guard Livereload](https://github.com/guard/guard-livereload "Guard Livereload")
By running `bundle exec guard` you can have your development browser auto reload on changes within your application

### [Guard RSpec](https://github.com/guard/guard-rspec)
Live checking of rspec tests
