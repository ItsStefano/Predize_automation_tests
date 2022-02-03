class LoginMLPage
  include Capybara::DSL

    def initialize
      #Elements Mapping
      @userField = '#user_id'
      @passwordField = '#password'
     
      # createAccountBtn = find('')
      # helpLbl = find('')
    end

    #Método de ajudo, que acessa a tela de login do Mercado Livre
    def accessLoginPage
        visit $CONFIG["ml_login_url"]
    end

    #Método para realizar o login no Mercado Livre
    def login(user, password)
      accessLoginPage

      find(@userField).set user
      click_button "Continuar"

      find(@passwordField).set password
      click_button "Entrar"
    end
  
    #Método para criar uma nova conta de usuário
    def createAccount
      accessLoginPage

      createAccountBtn.click
    end
    
    #Método para clicar no botão de Ajuda da tela de Login
    def needsHelp
      accessLoginPage

      helpLbl.click
    end 
end