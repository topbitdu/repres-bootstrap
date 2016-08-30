module Repres::Bootstrap::FormHelper

  def bootstrap_form_field(options = {})
    render partial: 'repres/bootstrap/form_field', locals: { options: options }
  end

  def bootstrap_form_select_box(options = {})
    render partial: 'repres/bootstrap/form_select_box', locals: { options: options }
  end

end
