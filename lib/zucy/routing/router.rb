module Zucy
  module Routing
    class Router
      def draw(&block)
        instance_eval(&block)
      end

      def get(path, to:)
        path = "/#{path}" unless path[0] = "/"
        klass_and_method = controller_and_action_for(to)
        @route_data = { path: path,
                        pattern: pattern_for(path),
                        klass_and_method: klass_and_method
                     }
        endpoints[:get] << @route_data
      end

      def post(path, to:)
        path = "/#{path}" unless path[0] = "/"
        klass_and_method = controller_and_action_for(to)
        @route_data = { path: path,
                        pattern: pattern_for(path),
                        klass_and_method: klass_and_method
                     }
        endpoints[:post] << @route_data
      end

      def put(path, to:)
        path = "/#{path}" unless path[0] = "/"
        klass_and_method = controller_and_action_for(to)
        @route_data = { path: path,
                        pattern: pattern_for(path),
                        klass_and_method: klass_and_method
                     }
        endpoints[:put] << @route_data
      end

      def patch(path, to:)
        path = "/#{path}" unless path[0] = "/"
        klass_and_method = controller_and_action_for(to)
        @route_data = { path: path,
                        pattern: pattern_for(path),
                        klass_and_method: klass_and_method
                     }
        endpoints[:patch] << @route_data
      end

      def delete(path, to:)
        path = "/#{path}" unless path[0] = "/"
        klass_and_method = controller_and_action_for(to)
        @route_data = { path: path,
                        pattern: pattern_for(path),
                        klass_and_method: klass_and_method
                     }
        endpoints[:delete] << @route_data
      end

      def root(to)
        get "/", to: to
      end

      def endpoints
        @endpoints ||= Hash.new { |hash, key| hash[key] = [] }
      end

      private

      def pattern_for(path)
        placeholders = []
        regexp_part = path.gsub(/(:\w+)/) do |match|
          placeholders << match[1..-1].to_sym
          "(?<#{placeholders.last}>[^/?#]+)"
        end
        [/^#{regexp_part}$/, placeholders]
      end

      def controller_and_action_for(path_to)
        controller_path, action = path_to.split("#")
        controller = "#{controller_path.capitalize}Controller"
        [controller, action.to_sym]
      end
    end
  end
end
