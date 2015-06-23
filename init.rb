require 'issues_controller_patch'
require 'view_issues_hook'
Redmine::Plugin.register :request_to_pdf do
  name 'Request To Pdf plugin'
  author 'Brian Mwadime'
  description 'Redmine plugin to export issue to custom pdf document'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://brianmwadime.com'
end
