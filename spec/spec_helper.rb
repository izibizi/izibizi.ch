# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
ENV['RACK_ENV'] = 'test'
require File.expand_path('../../boot.rb', __FILE__)
require 'rack/test'
require 'webmock/rspec'

RSpec.configure do |config|
  include Rack::Test::Methods
  WebMock.disable_net_connect!
  config.backtrace_exclusion_patterns << /\.bundle/

  def app
    Sinatra::Application
  end

  def web_response(name)
    path = File.expand_path("../fixtures/requests/#{name}.txt", __FILE__)
    File.new(path)
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.example_status_persistence_file_path = "spec/examples.txt"
  config.disable_monkey_patching!
  config.warnings = ENV['TRAVIS'].nil? # disable warnings on travis
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.profile_examples = 0
  config.order = :random
  Kernel.srand config.seed
end
