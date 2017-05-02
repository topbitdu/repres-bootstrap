# Repres Bootstrap Bootstrap资源表现引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/repres-bootstrap/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/repres-bootstrap.svg)](https://badge.fury.io/rb/repres-bootstrap)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/repres-bootstrap.svg)](https://gemnasium.com/github.com/topbitdu/repres-bootstrap)

Repres (REsource PRESentation) is a series of resource presentation engines. The Bootstrap resource presentation engine includes Bootstrap-based resource presentation templates & snippets.
Repres (资源表现)是一系列的资源表现引擎。Bootstrap 资源表现引擎包括基于Bootstrap的资源表现模版和片段。



## Recent Update

Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.



## Usage in Gemfile

```ruby
gem 'repres-bootstrap'
```



## Include the Helper in your Application Controller before Render the Style or Script with the helper methods

```ruby
helper Repres::Bootstrap::ApplicationHelper
helper Repres::Bootstrap::FormHelper
```



## Render the Pre-defined Partials

```erb
<html>

  <head>
    <%= render partial: 'repres/bootstrap/style', locals: { options: { bootstrap: true } } %>
    <!-- or the following line works identically -->
    <%= bootstrap_style bootstrap: true %>
  </head>

  <body>
    <div class='container'>
      <%= form_for @person do |f| %>

        <%= render partial: 'repres/bootstrap/form_field', locals: { options: { model: model, form: f, name: :phone_number, type: :telephone_field } } %>
        <!-- or the following line works identically -->
        <%= bootstrap_form_field model: model, form: f, name: :phone_number, type: :telephone_field %>

        <%= render partial: 'repres/bootstrap/form_select_box', locals: { options: { model: model, form: f, name: :gender, choices: { 'Male' => '1', 'Female' => '2' }, options: { include_blank: 'Please Select...' } } } %>
        <!-- or the following line works identically -->
        <%= bootstrap_form_select_box model: model, form: f, name: :gender, choices: { 'Male' => '1', 'Female' => '2' }, options: { include_blank: 'Please Select...' } %>

        <%= render partial: 'repres/bootstrap/form_check_box', locals: { options: { model: model, form: f, name: :gender, choices: { 'Male' => '1', 'Female' => '2' }, options: {} } } %>

        <%= render partial: 'repres/bootstrap/form_radio_box', locals: { options: { model: model, form: f, name: :gender, choices: { 'Male' => '1', 'Female' => '2' }, options: {} } } %>

      <% end %>
    </div>

    <%= render partial: 'repres/bootstrap/script', locals: { options: { bootstrap: true } } %>
    <!-- or the following line works identically -->
    <%= bootstrap_script bootstrap: true %>

  </body>

</html>
```

### Render the Script

The Script partial includes the HTML script tags for Bootstrap and its extensions. The [Boot CDN](http://cdn.bootcss.com/) server is supported by default. However, the :cdn option could be passed in to support other CDN servers. The CDN servers must syncrhonize with [cdnjs](https://github.com/cdnjs/cdnjs).

The following code snippet does __not__ load any JavaScript library.
```erb
<%= render partial: 'repres/bootstrap/script' %>
<!-- or the following line works identically -->
<%= bootstrap_script %>
```

The following code snippet loads the latest Bootstrap JavaScript library.
```erb
<%= render partial: 'repres/bootstrap/script', locals: { options: { bootstrap: true } } %>
<!-- or the following line works identically -->
<%= bootstrap_script bootstrap: true %>
```

The following code snippet loads the Bootstrap JavaScript library with the given version.
```erb
<%= render partial: 'repres/bootstrap/script', locals: { options: { bootstrap: { version: '3.3.5', cdn: 'cdn.server.com' } } } %>
<!-- or the following line works identically -->
<%= bootstrap_script bootstrap: { version: '3.3.5', cdn: 'cdn.server.com' } %>
```

The following JavaScript libraries are switchable, and the version can be configurable:
- :bootstrap
- :'bootstrap-material-design'
- :'flat-ui'
- :'bootstrap-datepicker'
- :'bootstrap-datetimepicker'
- :'bootstrap-fileinput'
- :'bootstrap-table'
- :'jquery.bootstrapvalidator'

### Render the Style

The Style partial includes the HTML style tags for Bootstrap and its extensions. The [Boot CDN](http://cdn.bootcss.com/) server is supported by default. However, the :cdn option could be passed in to support other CDN servers. The CDN servers must syncrhonize with [cdnjs](https://github.com/cdnjs/cdnjs).

The following code snippet does __not__ load any CSS library.
```erb
<%= render partial: 'repres/bootstrap/style' %>
<!-- or the following line works identically -->
<%= bootstrap_style %>
```

The following code snippet loads the latest Bootstrap CSS library.
```erb
<%= render partial: 'repres/bootstrap/style', locals: { options: { bootstrap: true } } %>
<!-- or the following line works identically -->
<%= bootstrap_style bootstrap: true %>
```

The following code snippet loads the Bootstrap CSS library with the given version.
```erb
<%= render partial: 'repres/bootstrap/style', locals: { options: { bootstrap: { version: '3.3.5', cdn: 'cdn.server.com' } } } %>
<!-- or the following line works identically -->
<%= bootstrap_style bootstrap: { version: '3.3.5', cdn: 'cdn.server.com' } %>
```

The following CSS libraries are switchable, and the version can be configurable:
- :bootstrap
- :'bootstrap-theme'
- :'bootstrap-material-design'
- :'flat-ui'
- :'bootstrap-datepicker'
- :'bootstrap-datetimepicker'
- :'bootstrap-fileinput'
- :'bootstrap-table'
- :'jquery.bootstrapvalidator'

### Render the Form Field

The Form Field partial includes the HTML form field tags for Rails Form Builder and Bootstrap.
```erb
<%= render partial: 'repres/bootstrap/form_field',
           locals: {
             options: {
               model: model,
               form:  f,
               name:  :phone_number,
               type:  :telephone_field
             }
           }
%>
<!-- or the following line works identically -->
<%= bootstrap_form_field model: model, form: f, name: :phone_number, type: :telephone_field %>

<%= render partial: 'repres/bootstrap/form_field',
           locals: {
             options: {
               model: model,
               form:  f,
               name:  :photo,
               type:  :file_field,
               input_accept: 'image/*'
             }
           }
%>
<!-- or the following line works identically -->
<%= bootstrap_form_field model: model, form: f, name: :photo, type: :file_field, input_accept: 'image/*' %>
```

### Render the Form Select Box

The Form Select Box partial includes the HTML select tags for Rails Form Builder and Bootstrap.
```ruby
<%= render partial: 'repres/bootstrap/form_select_box',
           locals: {
             options: {
               model:   model,
               form:    f,
               name:    :country_id,
               choices: @countries.select('id, name').map { |country| [ country.name, country.id ] },
               options: { prompt: '请选择国家' }
             }
           }
%>
<!-- or the following line works identically -->
<%= bootstrap_form_select_box model: model, form: f, name: :country_id, choices: @countries.select('id, name').map { |country| [ country.name, country.id ] }, options: { prompt: '请选择国家' } %>
```

### Render the Form Check Box

The Form Check Box partial includes the HTML select tags for Rails Form Builder and Bootstrap.
```ruby
<%= render partial: 'repres/bootstrap/form_check_box',
           locals: {
             options: {
               model:   model,
               form:    f,
               name:    :country_id,
               choices: @countries.select('id, name').map { |country| [ country.name, country.id ] },
               options: {}
             }
           }
%>
<!-- or the following line works identically -->
<%= bootstrap_form_check_box model: model, form: f, name: :country_id, choices: @countries.select('id, name').map { |country| [ country.name, country.id ] }, options: {} %>
```

### Render the Form Radio Box

The Form Check Box partial includes the HTML select tags for Rails Form Builder and Bootstrap.
```ruby
<%= render partial: 'repres/bootstrap/form_radio_box',
           locals: {
             options: {
               model:   model,
               form:    f,
               name:    :country_id,
               choices: @countries.select('id, name').map { |country| [ country.name, country.id ] },
               options: {}
             }
           }
%>
<!-- or the following line works identically -->
<%= bootstrap_form_radio_box model: model, form: f, name: :country_id, choices: @countries.select('id, name').map { |country| [ country.name, country.id ] }, options: {} %>
```

The 4 options are required: model, form, name, and type.
Here are more options:
- label_text:   The customized label text.
- label_prefix: The label prefix.
- label_suffix: The label suffix.

- group_class: The CSS class for the form group wrapper. The .form-group class is mandatory, and can not be removed.
- label_class: the CSS class for the HTML label tag. The .control-label class is mandatory, and can not be removed.
- field_class: the CSS class for the wrapper of the form control. The .input-group class is mandatory, and can not be removed, if the input_prefix or the input_suffix is given. The .input-group class won't appear, if both of the input_prefix and the input_suffix are not given.
- input_class: The CSS class for the HTML input tag. The .form-control class is mandatory, and can not be removed.
- error_class: the CSS class for the validation error block of this field. The .text-danger class is mandatory, and can not be removed.

- input_prefix: the HTML source codes of input group addon before the form control.
- input_suffix: the HTML source codes of input group addon after the form control.
- input_accept: The HTML 5 attribute for the file input tag.
- input_data:   The HTML 5 Data attribute for the input tag.
- error_hidden: Determines whether the error message block should be shown if the field has any error.

- disabled:    the disabled attribute of a HTML input tag.
- maxlength:   the maxlength attribute of a HTML input tag.
- size:        the size attribute of a HTML input tag.
- placeholder: the placeholder attribute of a HTML input tag.
- readonly:    the readonly attribute of a HTML input tag.
- required:    the required attribute of a HTML input tag.
- rows:        the rows of a HTML Text Area.



## Generators

### Platform generator

The platform generator generates a platform with a version number. The platform name is administration in the following example.
```shell
rails generate repres:bootstrap:platform administration --version 4
```

This will insert the following routings into the config/routes.rb file:
```ruby
namespace :administration do
  namespace :v3 do
    resources :dashboards, only: :show
  end
end
```

This will create the following files:
```shell
app/assets/images/administration/v4/.keep
app/assets/images/shared/.keep
app/assets/images/administration/v4/shared/.keep
app/assets/javascripts/administration/v4/.keep
app/assets/javascripts/shared/.keep
app/assets/javascripts/administration/v4/shared/.keep
app/assets/stylesheets/administration/v4/.keep
app/assets/stylesheets/shared/.keep
app/assets/stylesheets/administration/v4/shared/.keep
app/controllers/concerns/priviledge_protection.rb
app/controllers/administration/v4/privileged_controller.rb
app/controllers/administration/v4/dashboards_controller.rb
app/helpers/administration/v4/application_helper.rb
app/views/layouts/administration/v4.html.erb
app/views/shared/.keep
app/views/administration/v4/shared/_script.html.erb
app/views/administration/v4/shared/_style.html.erb
```



## RSpec examples

```ruby
# spec/models/repres_spec.rb
require 'repres/bootstrap/models_rspec'

# spec/types/repres_spec.rb
require 'repres/bootstrap/types_rspec'

# spec/validators/repres_spec.rb
require 'repres/bootstrap/validators_rspec'
```
