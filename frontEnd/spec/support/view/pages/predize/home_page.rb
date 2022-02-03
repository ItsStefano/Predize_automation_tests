class HomePredizePage
    include Capybara::DSL
  
      def initialize
        #Elements Mapping
        @preOrderMenu = '#pre-order-menu'
        @proOrderMenu = '#pre-order-menu'
        
      end

    def accessPreOrderMenu
        find(@preOrderMenu).click
    end

end