class HomePredizePage
    include Capybara::DSL
  
      def initialize
        #Elements Mapping
        @preOrderMenu = '#pre-order-menu'
        @posOrderMenu = '#pos-order-menu'
        
      end

    def accessPreOrderMenu
        find(@preOrderMenu).click
    end

end