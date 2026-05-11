//
//  ListView.swift
//  d11
//
//  Created by Turma01-3 on 07/05/26.
//

import SwiftUI

struct ListView: View {
    var titleList: String
    var itemsList: [ItemModel]
    
    var body: some View {
        ZStack {
            Color(.yellow)
                .ignoresSafeArea()
            VStack {
                Text(titleList)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                VStack(spacing: 0) {
                    ForEach(itemsList, id: \.self) { item in
                        ItemView(itemModel: item)
                    }
                }
            }
        }
    }
}

#Preview {
    ListView(titleList: "ENTRADA", itemsList: [
        ItemModel(name: "Cuscuz Quentinho", price: 80.00, image: "cuscuz"),
        ItemModel(name: "Cuscuz do Bom", price: 80.00, image: "cuscuz"),
        ItemModel(name: "Cuscuz só o filé", price: 80.00, image: "cuscuz")
    ])
}
