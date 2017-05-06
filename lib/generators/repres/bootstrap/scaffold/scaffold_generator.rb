require "rails/generators/erb"
require "rails/generators/resource_helpers"

# TODO
# 1. Header
# 2. Footer
# 3. Side Menu
class Repres::Bootstrap::ScaffoldGenerator < Rails::Generators::NamedBase

  include Rails::Generators::ResourceHelpers

  source_root File.expand_path('../templates', __FILE__)
  argument :attributes, type: :array, default: [], banner: "field:type field:type"

# controllers start

  check_class_collision suffix: "Controller"

  class_option :helper, type: :boolean
  class_option :orm, banner: "NAME", type: :string, required: true,
      desc: "ORM to generate the controller for"

# controllers end

# views start

  def create_root_folder
    empty_directory File.join("app/views", controller_file_path)
  end

  def copy_view_files
    available_views.each do |view|
      [ :html ].each do |format|
        filename = "#{view}.#{format}.erb" #filename_with_extensions(view, format)
        template filename, File.join("app/views", controller_file_path, filename)
      end
    end
  end

# views end

# controllers start

  def create_controller_files
    template_file = "controller.rb"
    template template_file, File.join("app/controllers", controller_class_path, "#{controller_file_name}_controller.rb")
  end

# controllers end

# views start

  def available_views
    %w(index edit show new _form)
  end

# views end

  protected :available_views

end
