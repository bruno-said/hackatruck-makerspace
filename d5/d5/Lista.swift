//
//  Lista.swift
//  d5
//
//  Created by Turma01-3 on 23/04/26.
//

import SwiftUI

struct Lista: View {
    var body: some View {
        NavigationStack {
        VStack {
            Text("Menu de Cores")
                .bold()
                .font(.largeTitle)
                Spacer()
                VStack {
                    HStack {
                        NavigationLink (destination: Rosa()){
                            Image(systemName: "paintbrush")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding(30)
                                .foregroundStyle(Color("Branco"))
                                .background(Color("Rosa"))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        NavigationLink (destination: Azul()){
                            Image(systemName: "paintbrush.pointed")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding(30)
                                .foregroundStyle(Color("Branco"))
                                .background(Color("Azul"))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                    HStack {
                        NavigationLink (destination: Cinza()){
                            Image(systemName: "paintpalette")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding(30)
                                .foregroundStyle(Color("Branco"))
                                .background(Color("Cinza"))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        NavigationLink (destination: Lista()){
                            Image(systemName: "list.bullet")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding(30)
                                .foregroundStyle(Color("Branco"))
                                .background(Color("Vermelho"))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    Lista()
}
