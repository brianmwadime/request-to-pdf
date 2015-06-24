Rails.configuration.to_prepare do
  require 'request_to_pdf/patches/issues_controller_patch'
  require 'request_to_pdf/hooks/views_issues_hook'
end