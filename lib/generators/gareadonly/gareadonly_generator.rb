require 'rails/generators'

class GareadonlyGenerator < Rails::Generators::Base
  source_root File.expand_path("../../templates", __FILE__)
  desc "Creates GAReadonly initializer for your application"

  def copy_initializer
    template "gareadonly_initializer.rb", "config/initializers/gareadonly.rb"

    puts "Install complete! Thanks!"
  end
end
