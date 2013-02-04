module Middleman
  module ExampleExtension
    # class Options
    #   KEYS = [
    #            :foo,
    #            :bar
    #          ]
      
    #   KEYS.each do |name|
    #     attr_accessor name
    #   end
      
    # end

    class Options < Struct.new(:foo, :bar); end

    
    class << self
      # This is called upon `activate :example_extension`
      def registered(app, options_hash={}, &block)
        #raise options_hash.inspect

        # Create global setting. consider using `activate` options instead of global settings like this.
        app.set :my_feature_setting, %w(one two three)

        options = Options.new(options_hash)

        # Set user-defined options from config.rb
        yield options if block_given?

        # Set Defaults
        options.foo = "foo" if options.foo.nil?
        options.bar = "bar" if options.bar.nil?

        # Add method helpers to host app
        app.send :include, Helpers

        # Add methods config.rb
        app.extend ClassMethods

        # Execute before middleman renders a page.
        # Should this go inside `configure :build` block?
        app.before do |obj|
          # Set the :currently_requested_path value at the beginning of each request
          #puts request.path_info
          #app.set :currently_requested_path, request.path_info

          # You must return true or false during this hook
          true
        end

        # This will be executed after config.rb has been loaded
        app.after_configuration do
          #the_users_setting = app.settings.css_dir
          #set :my_setting, "#{the_users_setting}_with_my_suffix"

          # Render a page from this extension
          require 'middleman-example-extension/extension_page'
          sitemap.register_resource_list_manipulator(:extension_page, ExtensionPage.new(self), false)          
        end

        # Execute code after the build process has finished
        app.after_build do |builder|
          # The builder object is a Thor object, so you can run thor actions from it.
          #   http://rubydoc.info/github/wycats/thor/master/Thor/Actions
          #builder.run my_deploy_script.sh
        end        
      end

      alias :included :registered      
    end

    # These methods will be available in config.rb
    module ClassMethods
      def say_hello
        puts "Hello"
      end
    end

    module Helpers
      def my_helper
        # print out setting we defined earlier
        my_feature_setting.join " "
      end      
    end
  end
end