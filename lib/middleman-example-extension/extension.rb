module Middleman
  module ExampleExtension
    class Options
      KEYS = [
               :foo,
               :bar
             ]
      
      KEYS.each do |name|
        attr_accessor name
      end
      
    end
    
    class << self
      # This is called upon `activate :directory_indexes`
      def registered(app, options_hash={}, &block)
        options = Options.new(options_hash)
        yield options if block_given?

        # Set Defaults
        options.txt              = true if options.txt.nil?
        options.xml              = false if options.xml.nil?

        app.send :include, Helpers

        app.after_configuration do
        end
      end
    end

    module Helpers
    end
  end
end