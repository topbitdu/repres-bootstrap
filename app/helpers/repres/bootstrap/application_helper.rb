module Repres::Bootstrap::ApplicationHelper

  def bootstrap_form_field(options = {})
    warn 'Repres::Bootstrap::ApplicationHelper#bootstrap_form_field is deprecated and will be removed in the future, please use Repres::Bootstrap::FormHelper#bootstrap_form_field instead.'
    #super options
    render partial: 'repres/bootstrap/form_field', locals: { options: options }
  end

  def bootstrap_form_select_box(options = {})
    warn 'Repres::Bootstrap::ApplicationHelper#bootstrap_form_select_box is deprecated and will be removed in the future, please use Repres::Bootstrap::FormHelper#bootstrap_form_select_box instead.'
    #super options
    render partial: 'repres/bootstrap/form_select_box', locals: { options: options }
  end

  def bootstrap_script(options = {})
    render partial: 'repres/bootstrap/script', locals: { options: options }
  end

  def bootstrap_style(options = {})
    render partial: 'repres/bootstrap/style', locals: { options: options }
  end

  #class << self
  #  deprecate bootstrap_form_field:      :'Repres::Bootstrap::ApplicationHelper.bootstrap_form_field',      deprecator: ActiveSupport::Deprecation.new('2.0', 'repres-bootstrap')
  #  deprecate bootstrap_form_select_box: :'Repres::Bootstrap::ApplicationHelper.bootstrap_form_select_box', deprecator: ActiveSupport::Deprecation.new('2.0', 'repres-bootstrap')
  #end

end
