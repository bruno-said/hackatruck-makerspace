//
//  ContentView.swift
//  d8
//
//  Created by Turma01-3 on 28/04/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("wallpaper")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        Image("gryffindor")
                            .resizable()
                            .frame(width: 200, height: 250)
                        VStack(spacing: 0){
                            ForEach(viewModel.personagens) { p in
                                NavigationLink(destination: Info(personagem: p)) {
                                    HStack {
                                        AsyncImage(url: URL(string: p.image ?? "")) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 130, height: 130)
                                        .clipShape(.circle)
                                        .padding([.top, .bottom], 10)
                                        Text(p.name ?? "")
                                            .padding()
                                            .font(.system(size: 20, weight: .bold, design: .rounded))
                                            .foregroundStyle(.yellow)
                                    }
                                }
                                .padding(.leading, 30)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color("DarkRed"))
                            }
                        }
                    }
                }
            }
        }
        .onAppear() {
            viewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
