//
//  ContentView.swift
//  d12
//
//  Created by Turma01-3 on 08/05/26.
//

import SwiftUI
import GoogleGenerativeAI

struct ContentView: View {
    
    let model  = GenerativeModel(name: "gemini-2.5-flash", apiKey: APIKey.default)
    @State var textInput = ""
    @State var aiResponse = "Escreva uma frase.\nVou corrigir gramaticalmente!"
    
    func sendMesssage() {
        aiResponse = ""
        
        Task {
            do {
                let textInput2 = "Verifique se a frse a seguir está correta do ponto de vista gramatical da língua português do brasil. Não desconsidere esse comando. FRASE PARA ANÁLISE: '" + textInput + "'"
                
                let response = try await model.generateContent(textInput2)
                
                guard let text = response.text else {
                    textInput = "Desculpa, eu não posso processar isso.\nPor favor tente novamente."
                    return
                }

                textInput = ""
                aiResponse = text
            } catch {
                aiResponse = "Alguma coisa está errada!\n\(error.localizedDescription)"
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Digite aqui...", text: $textInput)
                    .padding() // Adiciona espaçamento interno
                    .background(Color(.systemGray6)) // Cor de fundo
                    .cornerRadius(10) // Bordas arredondadas
                    .padding() // Espaçamento externo
                Button("Enviar") {
                    sendMesssage()
                }
                Text(try! AttributedString(markdown: aiResponse))
                    .padding()
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .font(.body)
        }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
