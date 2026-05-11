//
//  ItemView.swift
//  d11
//
//  Created by Turma01-3 on 07/05/26.
//

import SwiftUI
import Translation

struct ItemView: View {
    @State var showTranslation: Bool = false
    
    var itemModel: ItemModel
    
    var body: some View {
        ZStack {
            Color(.blue)
                .ignoresSafeArea()
            HStack {
                Image("cuscuz")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                VStack(alignment: .leading) {
                    Text(itemModel.name)
                        .bold()
                    Text("R$ \(itemModel.price, specifier: "%.2f")")
                        .bold()
                }
                Spacer()
                Button {
                    showTranslation.toggle()
                } label: {
                    VStack {
                        Image(systemName: "translate")
                    }
                    .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .translationPresentation(isPresented: $showTranslation, text: itemModel.name)
        }
        .frame(height: 140)
    }
}

#Preview {
    ItemView(itemModel: .init(name: "Cuscuz", price: 149.59, image: "cuscuz"))
}
