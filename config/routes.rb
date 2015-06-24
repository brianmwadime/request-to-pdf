# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get '/issues/export/pdf/:id', controller: :issues, action: :export_pdf