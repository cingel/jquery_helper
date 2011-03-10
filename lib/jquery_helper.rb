module ActionView
  module Helpers
    module PrototypeHelper
      class JavaScriptGenerator
        module GeneratorMethods
          
          def replace_html(id, *options_for_render)
            call "jQuery('##{id}').html", render(*options_for_render)
          end
          
        end
      end
    end
    
    module JavaScriptHelper
      
      def javascript_onready_tag(content_or_options_with_block = nil, html_options = {}, &block)
        content =
          if block_given?
            html_options = content_or_options_with_block if content_or_options_with_block.is_a?(Hash)
            capture(&block)
          else
            content_or_options_with_block
          end

        content_tag(:script, javascript_onready_section(content), html_options.merge(:type => Mime::JS))
      end
      
      def javascript_onready_section(content)
        jquery_onready_section(content)
      end
      
      def jquery_onready_section(content)
        javascript_cdata_section("jQuery(function($){\n#{content}\n})")
      end
    
    end
    
  end
end
