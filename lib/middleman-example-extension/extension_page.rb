# This purpose of this class is to use `maniupulate_resource_list` to add a page to your app's sitemap.
module Middleman
  module ExampleExtension 
    class ExtensionPage
      def initialize(app)
        @app = app
      end
     
      def manipulate_resource_list(resources)
        # Create a Resource object which will define the location of a page that will be added to the site and stored in the extension.
        extension_page = ::Middleman::Sitemap::Resource.new(
          @app.sitemap,
          "extension_page.html", # The URL
          File.join(File.dirname(__FILE__), 'source', 'extension_page.md') # Path to your template
        )
        resources << extension_page
        resources
      end     
    end
  end
end