# Repres Bootstrap Bootstrap资源表现引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/repres-bootstrap.svg)](https://badge.fury.io/rb/repres-bootstrap)

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
include Repres::Bootstrap::ApplicationHelper
include Repres::Bootstrap::FormHelper
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

      <% end %>
    </div>

    <%= render partial: 'repres/bootstrap/script', locals: { options: { bootstrap: true } } %>
    <!-- or the following line works identically -->
    <%= bootstrap_script bootstrap: true %>

  </body>

</html>
```



### Render the Script
The Script partial includes the HTML script tags for Bootstrap and its extensions. Only the [Boot CDN](http://cdn.bootcss.com/) servers are supported.

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
<%= render partial: 'repres/bootstrap/script', locals: { options: { bootstrap: { version: '3.3.5' } } }
%>
<!-- or the following line works identically -->
<%= bootstrap_script bootstrap: { version: '3.3.5' } %>
```

The following JavaScript libraries are switchable, and the version can be configurable:
- :bootstrap
- :'bootstrap-datepicker'
- :'bootstrap-datetimepicker'
- :'bootstrap-fileinput'
- :'bootstrap-table'



### Render the Style
The Style partial includes the HTML style tags for Bootstrap and its extensions. Only the [Boot CDN](http://cdn.bootcss.com/) servers are supported.

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
<%= render partial: 'repres/bootstrap/style', locals: { options: { bootstrap: { version: '3.3.5' } } } %>
<!-- or the following line works identically -->
<%= bootstrap_style bootstrap: { version: '3.3.5' } %>
```

The following CSS libraries are switchable, and the version can be configurable:
- :bootstrap
- :'bootstrap-theme'
- :'bootstrap-datepicker'
- :'bootstrap-datetimepicker'
- :'bootstrap-fileinput'
- :'bootstrap-table'



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



The 4 options are required: model, form, name, and type.
Here are more options:
- label_text:   The customized label text.
- label_prefix: The label prefix.
- label_suffix: The label suffix.

- group_class: The CSS class for the form group wrapper. The .form-group class is mandatory, and can not be removed.
- label_class: the CSS class for the HTML label tag. The .control-label class is mandatory, and can not be removed.
- field_class: the CSS class for the wrapper of the form control. The .input-group class is mandatory, and can not be removed.
- input_class: The CSS class for the HTML input tag. The .form-control class is mandatory, and can not be removed.
- error_class: the CSS class for the validation error block of this field. The .text-danger class is mandatory, and can not be removed.

- input_prefix: the HTML source codes of input group addon before the form control.
- input_suffix: the HTML source codes of input group addon after the form control.
- input_accept: The HTML 5 attribute for the file input tag.
- input_data:   The HTML 5 Data attribute for the input tag.
- error_hidden: Determines whether the error message block should be shown if the field has any error.

- disabled:    the disabled attribute of a HTML input tag.
- maxlength:   the maxlength attribute of a HTML input tag.
- placeholder: the placeholder attribute of a HTML input tag.
- readonly:    the readonly attribute of a HTML input tag.
- required:    the required attribute of a HTML input tag.
- rows:        the rows of a HTML Text Area
