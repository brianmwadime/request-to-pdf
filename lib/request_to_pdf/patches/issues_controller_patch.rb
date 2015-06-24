module RequestToPdf
  module Patches
    module IssuesControllerPatch
      def self.included(base)
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        base.class_eval do
          skip_before_filter :authorize
        end
      end

      module ClassMethods; end
      module InstanceMethods
      def export_pdf
        begin
          issue = Issue.find(params[:id])
          if (issue.nil? || issue == [ ])
            #render_404
            #return
          end
          print_request(issue)
        rescue ActiveRecord::RecordNotFound
          #render_404
        end
      end

      #end of export
      private
      def print_request(issue)
        # create a pdf from a URL
        pdf = WickedPdf.new.pdf_from_url('http://192.241.219.167/communication_request', :page_size => 'A4', :outline => false, :no_pdf_compression => true, :margin => {:top => 0, :bottom =>0, :left=>0, :right =>0})
        #pdf = WickedPdf.new.pdf_from_string('<h1>Hello There!</h1>')
        #pdf = PDFKit.new('http://192.241.219.167/communication_request')

        send_data(pdf, :filename => "#{issue.subject}-request.pdf", :type => 'application/pdf')
      end
      #end print_request
      end
    end
  end
end

unless IssuesController.included_modules.include?(RequestToPdf::Patches::IssuesControllerPatch)
  IssuesController.send(:include, RequestToPdf::Patches::IssuesControllerPatch)
end