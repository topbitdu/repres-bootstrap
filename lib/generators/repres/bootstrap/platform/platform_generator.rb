# rails generate repres:bootstrap:platform administration --version 2

class Repres::Bootstrap::PlatformGenerator < Rails::Generators::NamedBase

  # https://github.com/erikhuda/thor/blob/master/lib/thor/base.rb#L273
  class_option :version, type: :numeric, required: false, default: 1, desc: 'a positive integer, the default value is 1'

  source_root File.expand_path('../templates', __FILE__)

  def produce

=begin
    puts "file_name  = #{file_name.inspect}"
    puts "file_path  = #{file_path.inspect}"
    puts "namespace  = #{namespace.inspect}"
    puts "class_name = #{class_name.inspect}"
    puts "class_path = #{class_path.inspect}"
    puts "human_name = #{human_name.inspect}"
    puts "options    = #{options.inspect}"

    puts '---- ----'
    puts "class_options = #{self.class.class_options.inspect}"
=end

    @platform_name  = file_name.downcase
    @version_number = options['version'].to_i

    generate_asset_image
    generate_asset_script
    generate_asset_style

    generate_concern
    generate_controller

    generate_helper

    generate_view_layout
    generate_view_shared

    generate_route

  end

  def define_namespace(content)
    content.gsub! /PlatformModuleName/, platform_module_name
    content.gsub! /VersionModuleName/,  version_module_name
    content.gsub! /platform_name/,      platform_name
    content.gsub! /version_name/,       version_name
    content
  end

  # image
  #
  #   app/assets/images/shared/
  #   app/assets/images/{platform}/{version}/shared
  #
  def generate_asset_image
    empty_directory 'app/assets/images/shared'
    empty_directory "app/assets/images/#{platform_name}"
    empty_directory "app/assets/images/#{platform_name}/#{version_name}"
    empty_directory "app/assets/images/#{platform_name}/#{version_name}/shared"
  end

  # script
  #
  #   app/assets/javascripts/shared/
  #   app/assets/javascripts/{platform}/{version}/shared
  #
  def generate_asset_script
    empty_directory 'app/assets/javascripts/shared'
    empty_directory "app/assets/javascripts/#{platform_name}"
    empty_directory "app/assets/javascripts/#{platform_name}/#{version_name}"
    empty_directory "app/assets/javascripts/#{platform_name}/#{version_name}/shared"
  end

  # style
  #
  #   app/assets/stylesheets/shared/
  #   app/assets/stylesheets/{platform}/{version}/shared
  #
  def generate_asset_style
    empty_directory 'app/assets/stylesheets/shared'
    empty_directory "app/assets/stylesheets/#{platform_name}"
    empty_directory "app/assets/stylesheets/#{platform_name}/#{version_name}"
    empty_directory "app/assets/stylesheets/#{platform_name}/#{version_name}/shared"
  end

  # concern
  #
  #   app/controllers/concerns/priviledge_protection.rb
  #
  def generate_concern
    copy_file 'app/controllers/concerns/priviledge_protection.rb'
  end

  # controller
  #
  #   app/controllers/{platform}/{version}/privileged_controller.rb
  #   app/controllers/{platform}/{version}/dashboards_controller.rb
  #
  def generate_controller
    empty_directory "app/controllers/#{platform_name}"
    empty_directory "app/controllers/#{platform_name}/#{version_name}"
    copy_file('app/controllers/privileged_controller.rb', "app/controllers/#{platform_name}/#{version_name}/privileged_controller.rb") { |content| define_namespace content }
    copy_file('app/controllers/dashboards_controller.rb', "app/controllers/#{platform_name}/#{version_name}/dashboards_controller.rb") { |content| define_namespace content }
  end

  # helper
  #
  #   app/helpers/{platform}/{version}/application_helper.rb
  #
  def generate_helper
    empty_directory "app/helpers/#{platform_name}"
    empty_directory "app/helpers/#{platform_name}/#{version_name}"
    copy_file('app/helpers/platform_helper.rb', "app/helpers/#{platform_name}/#{version_name}/application_helper.rb") { |content| define_namespace content }
  end

  # view_shared
  #
  #   app/views/shared/
  #   app/views/{platform}/{version}/shared/_script.html.erb
  #   app/views/{platform}/{version}/shared/_style.html.erb
  #
  def generate_view_shared
    empty_directory 'app/views/shared'
    empty_directory "app/views/#{platform_name}"
    empty_directory "app/views/#{platform_name}/#{version_name}"
    empty_directory "app/views/#{platform_name}/#{version_name}/shared"
    copy_file('app/views/shared/_script.html.erb', "app/views/#{platform_name}/#{version_name}/shared/_script.html.erb") { |content| define_namespace content }
    copy_file('app/views/shared/_style.html.erb',  "app/views/#{platform_name}/#{version_name}/shared/_style.html.erb" ) { |content| define_namespace content }
  end

  # view_layout
  #
  #   app/views/layouts/{platform}/{version}.html.erb
  #
  def generate_view_layout
    empty_directory "app/views/layouts/#{platform_name}"
    copy_file('app/views/layouts/platform.html.erb', "app/views/layouts/#{platform_name}/#{version_name}.html.erb") { |content| define_namespace content }
  end

  # route
  #
  #   config/routes.rb
  #
  def generate_route
    source = File.expand_path find_in_source_paths('config/routes.rb')
    File.open(source, 'rb') { |f| route define_namespace(f.read.to_s.strip) }
  end

  # Administration
  def platform_module_name
    #@platform_name.capitalize
    @platform_name.camelize
  end

  # administration
  def platform_name
    @platform_name
  end

  # Administration::V1
  def platform_version_module_name
    "#{platform_module_name}::#{version_module_name}"
  end

  # V1
  def version_module_name
    "V#{version_number}"
  end

  # v1
  def version_name
    "v#{version_number}"
  end

  # 1
  def version_number
    @version_number
  end

  private :define_namespace,
    :generate_asset_image, :generate_asset_script, :generate_asset_style,
    :generate_concern,     :generate_controller,   :generate_helper,
    :generate_view_layout, :generate_view_shared,  :generate_route,
    :platform_module_name, :platform_name,         :platform_version_module_name,
    :version_module_name,  :version_name,          :version_number

end


=begin install or application

    ROADMAP.md
      # Picasso 线路图
      ## v1.0

    CHANGELOG.md
      # Picasso 变更日志
      ## v1.0

    DEPLOYMENT.md
# Picasso 发布手册



## 环境变量

### 基础安全钥匙
引用文件： __config/secrets.yml__
- __XXXXXX_SECRET_KEY_BASE__ 基础安全钥匙。开发和测试模式下，已经生成128个字符的随机字符串，生产环境则无缺省值，需要在Web服务器中配置。一旦Web应用上线，则不能修改。

### 数据库
引用文件： __config/database.yml__
- __XXXXXX_DATABASE_HOST__ 数据库服务器的主机IP或域名。尽量用内网IP避免消耗公网流量。缺省为 'localhost'。
- __XXXXXX_DATABASE_PORT__ 数据库服务器的端口号。缺省为 5432。
- __XXXXXX_DATABASE_POOL__ 数据库服务器的连接池的数量。所有连接到同一台数据库服务器的连接池数量的总和，应比数据库服务器允许的最大连接数小 1。缺省为 200。
- __XXXXXX_DATABASE_NAME__ 连接的数据库名称。缺省为 'xxxxxx' 。
- __XXXXXX_DATABASE_ADAPTER__  连接数据库服务器的驱动名称。缺省为 'postgresql' 。
- __XXXXXX_DATABASE_ENCODING__ 连接数据库服务器的字符编码集。缺省为 'unicode' 。
- __XXXXXX_DATABASE_USERNAME__ 连接数据库服务器的用户名。缺省为 'developer' 。
- __XXXXXX_DATABASE_PASSWORD__ 连接数据库服务器的密码。缺省为 'password' 。

### 分页
引用文件： __config/application.rb__
- __XXXXXX_PER_PAGE__        Web UI 的列表的每页条数的缺省值，缺省值为10。
- __XXXXXX_DOSSER_PER_PAGE__ Dosser API 的列表的每页条数的缺省值，缺省值为5。

### Swagger Web API 文档
引用文件： __config/initializers/swagger_engine.rb__
- __XXXXXX_SWAGGER_USERNAME__ Swagger交互式文档系统的用户名，缺省值为 swagger。
- __XXXXXX_SWAGGER_PASSWORD__ Swagger交互式文档系统的密码，缺省值为 xxxxxx。

### 主服务
引用文件： __config/application.rb__
- __XXXXXX_PICASSO_ADMINISTRATION_PORTAL_DOSSER_LINK__ 位置跟踪微能力的系统管理平台的门户链接。缺省值为 http://xxxxxx.alpha/administration-api/v1/portals/~.json 。
- __XXXXXX_PICASSO_GOVERNANCE_PORTAL_DOSSER_LINK__     位置跟踪微能力的行政管理平台的门户链接。缺省值为 http://xxxxxx.alpha/governance-api/v1/portals/~.json 。
- __XXXXXX_PICASSO_PRACTITION_PORTAL_DOSSER_LINK__     位置跟踪微能力的从业人员平台的门户链接。缺省值为 http://xxxxxx.alpha/practition-api/v1/portals/~.json 。

## 发布指令

### v1.0
1. bundle exec rake db:create
2. bundle exec rake db:migrate
3. bundle exec rake db:seed
4. bundle exec rake assets:precompile

=end


