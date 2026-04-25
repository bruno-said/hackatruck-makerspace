//
//  Info.swift
//  d6
//
//  Created by Turma01-3 on 24/04/26.
//

import SwiftUI

struct Info: View {
    @State var filme: Midia = Midia(nome: "", ano: 0)
    var body: some View {
        Text(filme.nome)
    }
}

#Preview {
    Info()
}
