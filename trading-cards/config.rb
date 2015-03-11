data.personas.persona.each do |persona|
  proxy "/cards/#{persona.slug}.html", "/cards/template.html", :locals => { :persona => persona }, :ignore => true
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do

  activate :minify_css
  activate :minify_javascript
  # activate :asset_hash

  activate :relative_assets
  set :relative_links, true

end
