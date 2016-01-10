
$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")
# $LOAD_PATH.unshift File.expand_path('../../app/controllers', __FILE__)

module Todolist
  class Application < Zucy::Application

  end
end