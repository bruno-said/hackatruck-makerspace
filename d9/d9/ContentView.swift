//
//  ContentView.swift
//  d9
//
//  Created by Turma01-3 on 29/04/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    @State var nome: String = ""
    @State var idade: Int = 0
    
    var body: some View {
        VStack {
            TextField("Nome", text: $nome)
                .textFieldStyle(.roundedBorder)
                .frame(width: 380)
            TextField("Idade", value: $idade, format: .number)
                .textFieldStyle(.roundedBorder)
                .frame(width: 380)
            Button("Inserir Pessoa", action: {
                Task {
                    await viewModel.post(pessoa: Pessoa(nome: nome, idade: idade))
                }
            })
            .frame(width: 380, height: 60)
            .background(.blue)
            .foregroundStyle(.white)
            .cornerRadius(10)
            .font(.largeTitle)
            ForEach(viewModel.pessoas, id: \.self) { pessoa in
                VStack {
                    Text("Nome: \(pessoa.nome)\nIdade: \(pessoa.idade)")
                        .foregroundStyle(.white)
                }
                .padding(.leading, 10)
                .frame(width: 380, height: 60, alignment: .leading)
                .background(.red)
                .cornerRadius(10)
            }
            Spacer()
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true){_ in 
                viewModel.fetch()
            }
//            viewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
