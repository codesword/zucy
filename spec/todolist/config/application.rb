require "zucy"
$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")

module Todolist
  class Application < Zucy::Application

  end
end