//
//  Azul.swift
//  d5
//
//  Created by Turma01-3 on 23/04/26.
//

import SwiftUI

struct Azul: View {
    var body: some View {
        ZStack {
            Color("Azul")
                .ignoresSafeArea()
            VStack {
                Image(systemName: "paintbrush.pointed")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .padding(30)
                    .foregroundStyle(Color("Azul"))
                    .background(Color("Preto"))
                    .clipShape(.circle)
            }
        }
    }
}

#Preview {
    Azul()
}
