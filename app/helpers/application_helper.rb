# frozen_string_literal: true

module ApplicationHelper
    def toastr_flash
        flash.each_with_object([]) do |(type, message), flash_messages|
          
          type = 'success' if type == 'notice'
          type = 'error' if type == 'alert'
          title = 'Hooray!' if type == 'notice'
          title = 'Oh snap!' if type == 'alert'
    
          text = "<script>
            toastr.#{type}(\"#{message}\", '#{title}', { 
                closeButton: true, 
                progressBar: true,
                positionClass: 'toast-top-center'
              })
          </script>".squish
    
          flash_messages << text.html_safe if message
          flash_messages.join("\n")
    
        end
      end
end
