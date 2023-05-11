ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "sidekiq/testing"
Sidekiq::Testing.fake!

require "mocha/minitest"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  if ENV["PARALELL_TESTING"] == "true"
    parallelize(workers: :number_of_processors)
  end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  include Warden::Test::Helpers
  Warden.test_mode!

  def assert_invalid(record, options)
    assert_predicate record, :invalid?

    options.each do |attribute, message|
      assert record.errors.details[attribute].any? { |hash| hash[:error] == message },
             "Expected #{attribute} to have the following error: #{message}"
    end
  end
end
