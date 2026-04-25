//
//  ContentView.swift
//  d3
//
//  Created by Turma01-3 on 17/04/26.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var showingAlert: Bool = false
    var body: some View {
        ZStack {
            Image("img0")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.2)
            VStack {
                Text("Bem vindo, " + username)
                    .font(.system(size: 32, weight: .bold, design: .default))
                TextField("Digite seu nome", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 32, design: .default))
                Spacer()
                Image("img1")
                    .resizable()
                    .frame(width: 300, height: 150)
                Image("img2")
                    .resizable()
                    .frame(width: 300, height: 150)
                Spacer()
                Button("Entrar") {
                    showingAlert = true
                }
                .font(.system(size: 32, weight: .bold, design: .default))
                .alert("ALERTA!", isPresented: $showingAlert) {
                    Button("Vamos lá!", role: .cancel) { }
                } message: {
                    Text("Você ira iniciar o desafio da aula agora")
                }
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
