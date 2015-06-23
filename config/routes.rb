# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'issues/exportpdf/:id', controller: :issues, action: :export_pdf
