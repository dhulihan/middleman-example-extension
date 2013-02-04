# middleman-example-extension

This is an example extension for [middleman](http://www.middlemanapp.com). The goal of this project is to help you learn how to write extensions for middleman.

## Installation

First, install the gem: 

	cd my-middleman-site/
	git clone git@github.com:dhulihan/middleman-example-extension.git vendor/gems/middleman-example-extension

Add this to `Gemfile`: 

	gem "middleman-example-extension", :path => File.expand_path(File.dirname(__FILE__) + "/vendor/gems")

Add this to `config/rb`:

	activate :middleman_example_extension do |middleman_example_extension| 
		middleman_example_extension.foo = "baz"
	end 
