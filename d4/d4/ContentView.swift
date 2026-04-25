//
//  ContentView.swift
//  d4
//
//  Created by Turma01-3 on 22/04/26.
//

import SwiftUI

struct ContentView: View {
    @State private var distance: Double = 0.0
    @State private var time: Double = 0.0
    @State private var velocity: Double = 0.0
    @State private var imageName: String = ""
    @State private var colorName: String = ""
    var body: some View {
        ZStack {
            Color(colorName)
                .ignoresSafeArea()
            VStack {
                Text("Entre com a distância")
                TextField("Entre com a distância", value: $distance, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Text("Entre com o tempo")
                TextField("Entre com o tempo", value: $time, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Text("\(velocity, specifier: "%.2f") km/h")
                Button("Calcular") {
                    if time != 0.0 {
                        velocity = distance / time
                    } else {
                        velocity = 0.0
                    }
                    
                    if velocity < 20 {
                        imageName = "napoleao"
                        colorName = "back0"
                    } else if velocity < 50 {
                        imageName = "josefina"
                        colorName = "back1"
                    } else {
                        imageName = "leao"
                        colorName = "back2"
                    }
                }
                Image(imageName)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(.circle)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
