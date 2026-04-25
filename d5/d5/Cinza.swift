//
//  Cinza.swift
//  d5
//
//  Created by Turma01-3 on 23/04/26.
//

import SwiftUI

struct Cinza: View {
    var body: some View {
        ZStack {
            Color("Cinza")
                .ignoresSafeArea()
            VStack {
                Image(systemName: "paintpalette")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .padding(30)
                    .foregroundStyle(Color("Cinza"))
                    .background(Color("Preto"))
                    .clipShape(.circle)
            }
        }
    }
}

#Preview {
    Cinza()
}
