require 'request_to_pdf_patches'
Redmine::Plugin.register :request_to_pdf do
  name 'Request To Pdf plugin'
  author 'Brian Mwadime'
  description 'Redmine plugin to export issue to custom pdf document'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://brianmwadime.com'


  project_module :request_to_pdf do
    #permission :allow_export_pdf, :issues => :index
    permission :allow_export_pdf, {:issues => [:export_pdf]}
  end

end
