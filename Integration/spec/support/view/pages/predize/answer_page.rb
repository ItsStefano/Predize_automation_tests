class AnswerPredizePage
    include Capybara::DSL
  
    def initialize
      #Elements Mapping
      @messageField = '#boxMessage'
      @btnAnswer = 'button[title="Atalho (Ctrl + Enter)"]'       
    end

    def sendAnswer(message)
        find(@messageField).set message
    end

    def confirmSendAnswer()
        find(@btnAnswer).click
    end
        
end