//
//  Rosa.swift
//  d5
//
//  Created by Turma01-3 on 23/04/26.
//

import SwiftUI

struct Rosa: View {
    var body: some View {
        ZStack {
            Color("Rosa")
                .ignoresSafeArea()
            VStack {
                Image(systemName: "paintbrush")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .padding(30)
                    .foregroundStyle(Color("Rosa"))
                    .background(Color("Preto"))
                    .clipShape(.circle)
            }
        }
    }
}

#Preview {
    Rosa()
}
