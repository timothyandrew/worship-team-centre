ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  def assert_times_equal(expected, actual)
    assert_equal expected.iso8601, actual.iso8601
  end

  def assert_change(proc, before, after, &blk)
    assert_equal before, proc.call, "Expected #{proc.inspect} to be '#{before}' initially"
    blk.call
    assert_equal after, proc.call, "Expected #{proc.inspect} to change from '#{before}' to '#{after}'"
  end

  # Order-insensitive array comparison
  def assert_contents_equal(expected, actual)
    assert_equal expected.sort, actual.sort
  end

  def assert_includes_collection(superset, subset)
    assert subset.all? {|item| superset.include?(item)}, "Expected #{superset} to include #{subset}"
  end
end
