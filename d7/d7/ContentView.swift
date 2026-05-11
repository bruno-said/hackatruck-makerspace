//
//  ContentView.swift
//  d7
//
//  Created by Turma01-3 on 27/04/26.
//

import SwiftUI
import MapKit

struct Location: Hashable {
    let nome: String
    let foto: String
    let descricao: String
    let latitude: Double
    let longitude: Double
}

struct ContentView: View {
    @State private var showSheet: Bool = false
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 1, longitude: -1),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    @State var itemSelecionado = Location(nome: "BCCP", foto: "foto", descricao: "descricao", latitude: 1, longitude: -1)
    let locations: [Location] = [
        Location(nome: "BCCP", foto: "foto", descricao: "Biblioteca Central", latitude: 1, longitude: -1),
        Location(nome: "Calourada", foto: "foto", descricao: "Lugar bem top, recomendo", latitude: 0, longitude: 1),
        Location(nome: "RU Velho", foto: "foto", descricao: "Grande e a comida é boa", latitude: 1, longitude: 0),
        Location(nome: "RU Novo", foto: "foto", descricao: "Pequeno mais o segundo andar é top", latitude: 0, longitude: -1),
        Location(nome: "Física", foto: "foto", descricao: "Livros top e cantina show", latitude: -1, longitude: -0),
        Location(nome: "Química", foto: "foto", descricao: "Cantina top, lab. da hora", latitude: -1, longitude: 1)
    ]
    var body: some View {
        ZStack {
            Map(position: $position) {
                ForEach(locations, id: \.self) { location in
                    Annotation(location.nome, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                        Button(location.nome) {
                            showSheet.toggle()
                        }
                        .sheet(isPresented: $showSheet) {
                            SelecionaItemView(itemSelecionado: $itemSelecionado)
                        }
                    }
                }
            }
            .ignoresSafeArea()
            VStack {
                Picker("Selecione", selection: $itemSelecionado) {
                    ForEach(locations, id: \.self) { location in
                        Text(location.nome)
                    }
                }
                .onChange(of: itemSelecionado) { oldValue, newValue in
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: newValue.latitude, longitude: newValue.longitude),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }
                .frame(width: 200, height: 50)
                .background(.yellow)
                .cornerRadius(10)
                .tint(.black)
                Spacer()
                Text("Locais da UFC")
                .frame(width: 200, height: 50)
                .background(.yellow)
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    ContentView()
}
