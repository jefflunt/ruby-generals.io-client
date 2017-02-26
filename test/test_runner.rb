require 'minitest/autorun'
require 'minitest/color'

$LOAD_PATH.unshift('lib')
Dir.glob('./lib/**/*.rb') { |f| require f }
Dir.glob('./test/**/*_test.rb') { |f| require f }
