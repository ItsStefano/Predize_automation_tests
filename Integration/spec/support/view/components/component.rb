class Components
    include Capybara::DSL
  
    def toastMessage
      return find(".Toastify__toast-body").text
    end

    def alertMLMessage
      return find(".andes-snackbar__message").text
    end
  
end
