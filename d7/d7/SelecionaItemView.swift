//
//  SelecionaItemView.swift
//  d7
//
//  Created by Turma01-3 on 27/04/26.
//

import SwiftUI

struct SelecionaItemView: View {
    @Binding var itemSelecionado: Location
    var body: some View {
        ZStack {
            Color(.yellow)
                .ignoresSafeArea()
            VStack {
                Text(itemSelecionado.nome)
                Text(itemSelecionado.descricao)
                    .frame(width: 300, height: 200, alignment: .topLeading)
                    .background(.brown)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    SelecionaItemView(itemSelecionado: .constant(Location(nome: "nome", foto: "foto", descricao: "descricao", latitude: 0.0, longitude: 0.0)))
}
