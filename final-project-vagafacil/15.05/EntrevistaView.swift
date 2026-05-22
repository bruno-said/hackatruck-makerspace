import SwiftUI
import GoogleGenerativeAI

struct EntrevistaView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = ViewModel()
    
    let vaga: Vaga
    
    let azulMarinho = Color(red: 15/255, green: 23/255, blue: 42/255)
    let cinzaFundo = Color(red: 243/255, green: 244/255, blue: 246/255)
    
    let model = GenerativeModel(
        name: "gemini-2.5-flash",
        apiKey: APIKey.default
    )
    
    @State private var perguntas: [String] = []
    @State private var respostas: [String: String] = [:]
    
    @State private var carregando = false
    @State private var erro = ""
    
    // ✅ novos estados
    @State private var mensagemFeedback = ""
    
    var body: some View {
        
        ZStack {
            
            cinzaFundo
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("Entrevista por IA")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(azulMarinho)
                
                Text(vaga.tit)
                    .font(.title3)
                    .foregroundColor(.gray)
                
                Button {
                    gerarPerguntas()
                } label: {
                    Text("Gerar perguntas")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(azulMarinho)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }
                
                if carregando {
                    ProgressView("Gerando perguntas...")
                }
                
                if !erro.isEmpty {
                    Text(erro)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                }
                
                ScrollView {
                    
                    VStack(spacing: 18) {
                        
                        ForEach(perguntas, id: \.self) { pergunta in
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text(pergunta)
                                    .font(.headline)
                                    .foregroundColor(azulMarinho)
                                
                                TextField(
                                    "Digite sua resposta",
                                    text: Binding(
                                        get: { respostas[pergunta] ?? "" },
                                        set: { respostas[pergunta] = $0 }
                                    ),
                                    axis: .vertical
                                )
                                .padding()
                                .background(.white)
                                .cornerRadius(14)
                            }
                            .padding()
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(18)
                        }
                    }
                    .padding(.top)
                }
                
                if !perguntas.isEmpty {
                    Button {
                        Task {
                            await enviarRespostasParaNodeRED()
                            
                            // ✅ mostra mensagem
                            await MainActor.run {
                                mensagemFeedback = "Entrevista enviada com sucesso!"
                            }
                            
                            // espera 1 segundo
                            try? await Task.sleep(nanoseconds: 1_000_000_000)
                            
                            // ✅ volta para tela inicial
                            await MainActor.run {
                                dismiss()
                            }
                        }
                    } label: {
                        Text("Finalizar entrevista")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(azulMarinho)
                            .foregroundColor(.white)
                            .cornerRadius(14)
                    }
                }
                
                // ✅ mensagem na tela
                if !mensagemFeedback.isEmpty {
                    Text(mensagemFeedback)
                        .foregroundColor(.green)
                }
            }
            .padding()
        }
    }
    
    func gerarPerguntas() {
        
        carregando = true
        erro = ""
        perguntas = []
        
        Task {
            do {
                let prompt = """
                Crie 5 perguntas curtas de entrevista para esta vaga:
                
                Cargo: \(vaga.tit)
                Descrição: \(vaga.inf)
                Requisitos: \(vaga.req)
                Diferenciais: \(vaga.dif)
                
                Responda apenas com uma pergunta por linha.
                """
                
                let response = try await model.generateContent(prompt)
                
                guard let texto = response.text else {
                    erro = "A IA não retornou texto."
                    carregando = false
                    return
                }
                
                perguntas = texto
                    .components(separatedBy: "\n")
                    .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                    .filter { !$0.isEmpty }
                
                carregando = false
                
            } catch {
                erro = error.localizedDescription
                carregando = false
            }
        }
    }
    
    // ✅ SUA FUNÇÃO ORIGINAL (inalterada)
    func enviarRespostasParaNodeRED() async {
        for (per, res) in respostas {
            print(per)
            print(res)
            await viewModel.chatEnvio(chat: Chat(per: per, res: res))
        }
    }
}
