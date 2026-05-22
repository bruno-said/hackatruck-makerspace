import SwiftUI

struct HistoricoVagasView: View {
    
    @StateObject var viewModel = ViewModel()
    
    let azulMarinho = Color(red: 15/255, green: 23/255, blue: 42/255)
    let cinzaFundo = Color(red: 243/255, green: 244/255, blue: 246/255)
    
    var body: some View {
        ZStack {
            cinzaFundo .ignoresSafeArea()
            ScrollView {
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Histórico de vagas")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(azulMarinho)
                            .padding(.top)
                        
                        Text("Aqui estão suas entrevistas realizadas.")
                            .foregroundColor(.gray)
                        
                        ForEach(viewModel.chat, id: \.self) { item in
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Pergunta:")
                                    .font(.headline)
                                    .foregroundColor(azulMarinho)
                                
                                Text(item.per)
                                    .foregroundColor(.gray)
                                
                                Text("Resposta:")
                                    .font(.headline)
                                    .foregroundColor(azulMarinho)
                                
                                Text(item.res)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(.white)
                            .cornerRadius(16)
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                viewModel.chatLeitura()
            }
        }
    }
}

#Preview {
    HistoricoVagasView()
}
