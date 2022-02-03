class DashMLPage
  include Capybara::DSL

    def initialize
      #Element Mapping
      @userLabel = "span[class='nav-header-username']"
      visit $CONFIG["ml_url"]
    end

    def getUserLogin()
      return find(@userLabel)
    end
      
end