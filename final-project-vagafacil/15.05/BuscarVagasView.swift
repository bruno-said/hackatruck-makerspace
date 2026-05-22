//
//  BuscarVagasView.swift
//  15.05
//
//  Created by Turma01-13 on 18/05/26.
//

import SwiftUI
// Tela de buscar vagas
struct BuscarVagasView: View {
    
    @StateObject var viewModel = ViewModel()
    let azulMarinho = Color(red: 15/255, green: 23/255, blue: 42/255)
    let cinzaFundo = Color(red: 243/255, green: 244/255, blue: 246/255)
    
    var body: some View {
        ZStack {
            
            cinzaFundo
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Buscar vagas")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(azulMarinho)
                        .padding(.top)
                    
                    Text("Veja as vagas disponíveis e escolha uma para concorrer.")
                        .foregroundColor(.gray)
                    
                    ForEach(viewModel.vagas, id: \.self) { vaga in
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text(vaga.tit)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(azulMarinho)
                            
                            Text(vaga.inf)
                                .foregroundColor(.gray)
                            
                            Text(vaga.req)
                                .font(.subheadline)
                            
                            Text(vaga.dif)
                                .font(.subheadline)
                            
                            NavigationLink {
                                EntrevistaView(vaga: vaga)
                            } label: {
                                Text("Concorrer")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 14)
                                    .background(azulMarinho)
                                    .foregroundColor(.white)
                                    .cornerRadius(14)
                            }
                            .padding(.top, 6)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(16)
                    }
                }
                .padding()
            }
            .scrollContentBackground(.hidden)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                viewModel.vagaLeitura()
            }
        }
    }
}
#Preview {
    ContentView()
}
