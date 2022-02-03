describe "Suite Case Pre-vendas: Importação e Envio de Pergunta" do
    before do
        @loginML = LoginMLPage.new
        @dashML = DashMLPage.new
        @productML = ProductTestMLPage.new

        @homePredize = HomePredizePage.new
        @loginPredize = LoginPredizePage.new
        @preOrderPage = PreOrderPredizePage.new
        @answersPage = AnswerPredizePage.new

        @components = Components.new

        @dataMass = Helpers::get_fixture("integration_data")

        #Logando no Mercado Livre
        @loginML.login(@dataMass[:user_ml_test], @dataMass[:password_ml_test])           
        expect(@dashML.getUserLogin.text).to eq "Test"

        #Enviando Mensagem ao vendedor do Produto de Teste
        @productML.productTestVisitPage
        @productML.sendAnswer(@dataMass[:question])
        expect(@components.alertMLMessage).to eql @dataMass[:question_ml_sucess]

    end
    context "Validar a importação da pergunta"  do
       
        it "Case #1 - Validar a importação da pergunta", :question do
            @loginPredize.login(@dataMass[:user_predize_test], @dataMass[:password_predize_test])
            expect(@components.toastMessage).to eql @dataMass[:msg_login_sucess]
            
            @homePredize.accessPreOrderMenu
            @preOrderPage.searchQuestion(@dataMass[:question])
            @preOrderPage.confirmSearchQuestion
            
            expect(@preOrderPage.questionIsFound?).to be true
        end

     
        it "Case #2 - Responder a pergunta feita no ML", :answer do
            @loginPredize.login(@dataMass[:user_predize_test], @dataMass[:password_predize_test])
            @homePredize.accessPreOrderMenu
            @preOrderPage.searchQuestion(@dataMass[:question])
            @preOrderPage.confirmSearchQuestion
            @preOrderPage.clickFirstQuestionInTable

            @answersPage.sendAnswer(@dataMass[:answerValue])
            @answersPage.confirmSendAnswer

            expect(@components.toastMessage).to eql @dataMass[:answer_send_sucess]
        end
    
    end 

end