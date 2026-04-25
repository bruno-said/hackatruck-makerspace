//
//  ContentView.swift
//  d6
//
//  Created by Turma01-3 on 24/04/26.
//

import SwiftUI

struct Midia: Hashable {
    var nome: String
    var ano: Int
}

struct ContentView: View {
    private var filmes: [Midia] = [
        Midia(nome: "Harry Potter", ano: 1999),
        Midia(nome: "Cidade de Papel", ano: 2012),
        Midia(nome: "A Cula é das Estrelas", ano: 2010),
        Midia(nome: "Piratas do Caribe", ano: 2015),
        Midia(nome: "Ainda estou aqui", ano: 2025)
    ]
    private var series: [Midia] = [
        Midia(nome: "Friends", ano: 1999),
        Midia(nome: "The Big Bang Theory", ano: 2012),
        Midia(nome: "Naruto", ano: 2010),
        Midia(nome: "My Hero Academy", ano: 2015),
        Midia(nome: "How to Meet Your Mother", ano: 2025)
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Filmes")
                        .bold()
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ForEach(filmes, id: \.self) { f in
                        NavigationLink (destination: Info(filme: f)){
                            VStack(alignment: .leading){
                                Text("   " + f.nome)
                                Text("   " + String(f.ano))
                            }
                            .frame(width: 380, height: 50, alignment: .leading)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                    Text("Séries")
                        .bold()
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ForEach(series, id: \.self) { s in
                        NavigationLink (destination: Info(filme: s)){
                            VStack(alignment: .leading){
                                Text("   " + s.nome)
                                Text("   " + String(s.ano))
                            }
                            .frame(width: 380, height: 50, alignment: .leading)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                    Text("Recomendados")
                        .bold()
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(filmes, id: \.self) { f in
                                NavigationLink (destination: Info(filme: f)){
                                    VStack(alignment: .leading){
                                        Text("   " + f.nome)
                                        Text("   " + String(f.ano))
                                    }
                                    .frame(width: 150, height: 200, alignment: .leading)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }
                }.padding()
                
            }
        }
    }
}

#Preview {
    ContentView()
}
