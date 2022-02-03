class LoginPredizePage
    include Capybara::DSL
  
      def initialize
        #Elements Mapping
        @userField = '#username'
        @passwordField = '#password'
        @btnLogin = '#login'
        @forgotPassword = '.login-form-a'
      end
  
      #Método de ajudo, que acessa a tela de login do Mercado Livre
      def accessPredizeLoginPage
          visit $CONFIG[:predize_url]
      end
  
      #Método para realizar o login no Mercado Livre
      def login(user, password)
        accessPredizeLoginPage
  
        find(@userField).set user  
        find(@passwordField).set password
        find(@btnLogin).click
      end
    
      #Método para criar uma nova conta de usuário
      def forgotPassword
        accessLoginPage
  
        @forgotPassword.click
      end
      

  end