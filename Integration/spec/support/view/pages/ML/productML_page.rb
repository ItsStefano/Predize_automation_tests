class ProductTestMLPage
    include Capybara::DSL

    def initialize
        #Element Mapping of Product Test     
        @fieldQuestion = 'textarea.andes-form-control__field'
        @askML = 'button[type="Submit"] span[class="andes-button__content"]'
        askConfirmation = './/main[@id="root-app"]//div[contains(concat(" ",normalize-space(@class)," ")," andes-snackbar ")][contains(concat(" ",normalize-space(@class)," ")," andes-snackbar--success ")][contains(concat(" ",normalize-space(@class)," ")," andes-snackbar--right ")][contains(concat(" ",normalize-space(@class)," ")," andes-snackbar--animate-show ")]/p'
        disclaimerCookie = '#newCookieDisclaimerButton'
        @questionValue = 'Teste automatizado, nao responder'
    end
    
    def productTestVisitPage
        visit $CONFIG['produt_test_ml_url']
    end

    def sendAnswer(question)   
        productTestVisitPage
        
        find(@fieldQuestion).set question
        find(@askML, text: "Perguntar").click
    end

    def sendPattnerAnswer()   
        productTestVisitPage
        
        find(@fieldQuestion).set @questionValue
        find(@askML, text: "Perguntar").click
    end

end