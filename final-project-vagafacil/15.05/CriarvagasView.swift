import SwiftUI

struct CriarVagaView: View {
    
    @StateObject var viewModel = ViewModel()
    
    @State private var nomeVaga: String = ""
    @State private var cargaHoraria: String = ""
    @State private var remuneracao: String = ""
    @State private var descricao: String = ""
    
    @State private var mensagemFeedback: String = ""
    @State private var estaEnviando: Bool = false
    
    let azulMarinho = Color(red: 15/255, green: 23/255, blue: 42/255)
    let cinzaFundo = Color(red: 243/255, green: 244/255, blue: 246/255)

    var body: some View {
        
        ZStack {
            cinzaFundo.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    Text("Criar vaga")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(azulMarinho)
                    
                    Group {
                        TextField("Nome da vaga", text: $nomeVaga)
                        TextField("Carga horária", text: $cargaHoraria)
                        TextField("Remuneração", text: $remuneracao)
                        
                        VStack(alignment: .leading) {
                            Text("Descrição")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            TextEditor(text: $descricao)
                                .frame(height: 120)
                                .padding(8)
                                .background(.white)
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(14)
                    
                    Button {
                        Task {
                            await enviarVaga()
                        }
                        
                    } label: {
                        if estaEnviando {
                            ProgressView()
                                .frame(maxWidth: .infinity)
                                .padding()
                        } else {
                            Text("Criar vaga")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(azulMarinho)
                                .foregroundColor(.white)
                                .cornerRadius(14)
                        }
                    }
                    .disabled(estaEnviando || camposInvalidos)
                    
                    if !mensagemFeedback.isEmpty {
                        Text(mensagemFeedback)
                            .foregroundColor(
                                mensagemFeedback.contains("sucesso") ? .green : .red
                            )
                    }
                }
                .padding()
            }
        }
    }
    
    var camposInvalidos: Bool {
        nomeVaga.isEmpty || cargaHoraria.isEmpty || remuneracao.isEmpty || descricao.isEmpty
    }
    
    func enviarVaga() async {
        
        estaEnviando = true
        mensagemFeedback = ""
        
        let vaga = Vaga(
            tit: nomeVaga,
            inf: cargaHoraria,
            req: remuneracao,
            dif: descricao
        )
        
        await viewModel.vagaEnvio(vaga: vaga)
        
        DispatchQueue.main.async {
            self.estaEnviando = false
            self.mensagemFeedback = "Vaga criada com sucesso!"
            self.limparCampos()
        }
    }
    
    func limparCampos() {
        nomeVaga = ""
        cargaHoraria = ""
        remuneracao = ""
        descricao = ""
    }
}

#Preview {
    CriarVagaView()
}
