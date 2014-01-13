require 'unihandecode'
require 'support/unihandecode_helper'
require 'pry'

RSpec.configure do |spec|
  spec.include UnihandecodeHelper

  spec.before(:all) do

    # make sure everything is run in tmp
    Dir.chdir '/tmp'
  end

  spec.after(:all) do
    # Do cleanup
  end

  at_exit do
    # Do cleanup
  end
end

def test_file(path)
  File.join(File.dirname(__FILE__), "test_files", path)
end

