//
//  ContentView.swift
//  d10
//
//  Created by Turma01-3 on 04/05/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    @State var listaDeDados: [Data] = []
    @State var ultimo: Data?
    
    var body: some View {
        VStack {
            Text(ultimo?.umidade ?? "")
            ProgressView("Loading...", value: (Double(ultimo?.umidade ?? "0") ?? 0.0) / 100.0, total: 1.0)
                .progressViewStyle(.linear) // Standard horizontal bar
                .tint(.blue) // Changes the fill color
                .padding()
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){ _ in
                viewModel.fetch()
//                listaDeDados = viewModel.dados

                if(!viewModel.dados.isEmpty){
                    ultimo = viewModel.dados.sorted(by: { $0.timestamp > $1.timestamp })[0]
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
