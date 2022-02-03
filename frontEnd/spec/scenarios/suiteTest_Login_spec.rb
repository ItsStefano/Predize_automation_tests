describe "Suite Case Pre-vendas: Importação e Envio de Pergunta" do
    before do
        @homePredize = HomePredizePage.new
        @loginPredize = LoginPredizePage.new

        @components = Components.new

    end
    context "TestSuite - Validar ações de Login no Sistema Predize"  do
        it "Case #1 - Realizar login com sucesso", :loginSucess do
            @loginPredize.login($CONFIG[:user_predize_test], $CONFIG[:password_predize_test])
            expect(@components.toastMessage).to eql $CONFIG[:msg_login_sucess]
        end
    end 

    testSuit = $CONFIG[:loginFailed]
   # testSuitFailed = Helpers::get_fixture("login")
    context "TestSuite - Validar fluxo de excessão do Login no Sistema Predize"  do
        testSuit.each do |testCase|
            it "#{testCase[:title]}", :loginFailed do 
                @loginPredize.login(testCase[:user_failed_test], testCase[:pass_failed_test])
    
                expect(@components.toastMessage).to eql testCase[:msg_failed_test]
            end
        end
    end
        

end