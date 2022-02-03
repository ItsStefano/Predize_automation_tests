class Components
    include Capybara::DSL
  
    def toastMessage
      return find(".Toastify__toast-body").text
    end
 
end
