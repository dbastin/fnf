require 'simplecov'
ENV['RAILS_ENV'] ||= 'test'

require 'coveralls'
Coveralls.wear!

SimpleCov.start 'rails' do
  SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]

  add_filter '/test/'
  add_filter '/config/'
end

SimpleCov.minimum_coverage 100.0
SimpleCov.command_name 'TestUnit'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all
end
