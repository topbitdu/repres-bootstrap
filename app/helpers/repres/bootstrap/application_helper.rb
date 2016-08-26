module Repres::Bootstrap::ApplicationHelper

  def bootstrap_form_field(options = {})
    render partial: 'repres/bootstrap/form_field', locals: { options: options }
  end

  def bootstrap_form_select_box(options = {})
    render partial: 'repres/bootstrap/form_select_box', locals: { options: options }
  end

  def bootstrap_script(options = {})
    render partial: 'repres/bootstrap/script', locals: { options: options }
  end

  def bootstrap_style(options = {})
    render partial: 'repres/bootstrap/style', locals: { options: options }
  end

end
