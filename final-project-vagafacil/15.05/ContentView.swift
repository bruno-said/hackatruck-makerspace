import SwiftUI
//import GoogleGenerativeAI

// Modelo básico da vaga.
// Futuramente, essa estrutura será usada para receber os dados vindos do Node-RED.

struct ContentView: View {
    
    var body: some View {
        TelaInicialView()
    }
}

// Tela inicial do aplicativo
struct TelaInicialView: View {
    
    let azulMarinho = Color(red: 15/255, green: 23/255, blue: 42/255)
    let cinzaFundo = Color(red: 243/255, green: 244/255, blue: 246/255)
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                cinzaFundo
                    .ignoresSafeArea()
                
                VStack(spacing: 35) {
                    
                    Spacer()
                    
                    Image(systemName: "briefcase.fill")
                        .font(.system(size: 70))
                        .foregroundColor(azulMarinho)
                    
                    Text("VagaFácil")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(azulMarinho)
                    
                    Text("Conectando pessoas e oportunidades")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink {
                        // Futuramente aqui será chamada a tela de criar vaga.
                        // Exemplo: CriarVagaView()
                        CriarVagaView()
                        
                    } label: {
                        Text("Criar vaga")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(azulMarinho)
                            .foregroundColor(.white)
                            .cornerRadius(16)
                    }
                    
                    NavigationLink {
                        BuscarVagasView()
                        
                    } label: {
                        Text("Buscar vagas")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(azulMarinho)
                            .foregroundColor(.white)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(azulMarinho, lineWidth: 1.5)
                            )
                    }
                    
                    NavigationLink {
                        HistoricoVagasView()
                        
                    } label: {
                        Text("Histórico de vagas")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(.white)
                            .foregroundColor(azulMarinho)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.gray, lineWidth: 1.5)
                            )
                    }
                    Spacer()
                }
                .padding(.horizontal, 28)
            }
        }
    }
}
#Preview {
    ContentView()
}
