class PreOrderPredizePage
    include Capybara::DSL
  
      def initialize
        #Elements Mapping
        @tablePreOrder = '#table-questions'
        @searchField = 'input[id="pre-order-searchField"]'
        @searchButton = 'button[id="pre-order-searchButton"]'
        @searchQuestion = 'Teste automatizado, nao responder'
        
      end

    def validatePreOrderPage?
        return page.has_css?("@tablePreOrder")
    end

    def searchQuestion(searchQuestion)
        find(@searchField).set searchQuestion
    end

    def confirmSearchQuestion
        find(@searchButton).click
        sleep 5
    end
    

    def questionIsFound?
        return page.has_css?('#table-questions tbody tr')
    end

    def clickFirstQuestionInTable
        first('#table-questions tbody tr').click
    end

end
