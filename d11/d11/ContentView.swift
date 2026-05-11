//
//  ContentView.swift
//  d11
//
//  Created by Turma01-3 on 07/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.yellow)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Text("HackaTruck GastroBar")
                        .font(.title)
                        .bold()
                    ListView(titleList: "ENTRADA", itemsList: [
                        ItemModel(name: "Cuscuz Quentinho", price: 80.00, image: "cuscuz"),
                        ItemModel(name: "Cuscuz do Bom", price: 80.00, image: "cuscuz"),
                        ItemModel(name: "Cuscuz só o filé", price: 80.00, image: "cuscuz")
                    ])
                    ListView(titleList: "PRINCIPAL", itemsList: [
                        ItemModel(name: "Cuscuz Show", price: 80.00, image: "cuscuz"),
                        ItemModel(name: "Cuscuz Massa", price: 80.00, image: "cuscuz"),
                        ItemModel(name: "Cuscuz Tradicional", price: 80.00, image: "cuscuz")
                    ])
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


