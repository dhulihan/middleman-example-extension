require "middleman-core"
  
# Register the extension
::Middleman::Extensions.register(:middleman_example_extension) do
  require "middleman-example-extension/extension"
  ::Middleman::ExampleExtension
end