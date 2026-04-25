//
//  ContentView.swift
//  d2
//
//  Created by Turma01-3 on 17/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image("profile")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
            Spacer()
            VStack {
                Text("Ada Lovelace")
                    .foregroundStyle(.red)
                Text("English mathematician")
                    .foregroundStyle(.blue)
                Text("First Woman Programmer")
                    .foregroundStyle(.yellow)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
