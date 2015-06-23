module RequestToPdf
  module Patches
    module IssuesControllerPatch
      def self.included(base)
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        base.class_eval do
          skip_before_filter :authorize_global
        end
      end

      module ClassMethods; end
      module InstanceMethods; 
      def export_pdf
        begin
          issue = Issue.find(params[:id])
          if (issue.nil? || issue == [ ])
            render_404
            return
          end
          print_request(issue)
        rescue ActiveRecord::RecordNotFound
          render_404
        end
      end

      #end of export
      private

      def print_request(issue)


      end
      #end print_request
      end
    end
  end
end

unless IssuesController.included_modules.include?(RequestToPdf::Patches::IssuesControllerPatch)
  IssuesController.send(:include, RequestToPdf::Patches::IssuesControllerPatch)
end