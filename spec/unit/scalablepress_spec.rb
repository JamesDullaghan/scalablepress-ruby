require 'spec_helper'

describe Scalablepress do
  it 'has a version number' do
    Scalablepress::VERSION.must_match(/\d+\.\d+\.\d+/)
  end
end
