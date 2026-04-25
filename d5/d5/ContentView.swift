//
//  ContentView.swift
//  d5
//
//  Created by Turma01-3 on 23/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                Rosa()
                    .tabItem {
                        Label("Rosa", systemImage: "paintbrush")
                    }
                Azul()
                    .tabItem {
                        Label("Azul", systemImage: "paintbrush.pointed")
                    }
                Cinza()
                    .tabItem {
                        Label("Cinza", systemImage: "paintpalette")
                    }
                Lista()
                    .tabItem {
                        Label("Lista", systemImage: "list.bullet")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
