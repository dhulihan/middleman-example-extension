require "middleman-core"
  
# Register the extensionm this is called during `activate :middleman_example_extension`
::Middleman::Extensions.register(:example_extension) do
  require "middleman-example-extension/extension"
  ::Middleman::ExampleExtension
end