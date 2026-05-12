//
//  ContentView.swift
//  vision
//
//  Created by Turma01-3 on 12/05/26.
//

import SwiftUI
import PhotosUI
import AVFoundation

struct ContentView: View {
    let sintetizador = AVSpeechSynthesizer()
    
    @StateObject var viewModel = ViewModel()
    
    @State private var imageToAnalise: UIImage?
    @State private var photoPicked: PhotosPickerItem?
    @State private var imageFlag: Bool = false
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                Text("StudyCast")
                    .foregroundStyle(.white)
                    .font(.title3)
                    .bold()
                if imageFlag {
                    Spacer()
                    Image(uiImage: imageToAnalise!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    Button(action: {
                        Task {
                            await viewModel.detect(photo: imageToAnalise)
                        }
                    }) {
                        Text("Analisar Texto")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.indigo)
                            .foregroundStyle(.white)
                            .cornerRadius(25)
                            .padding(.horizontal)
                    }
                    Button(action: {
                        let enunciado = AVSpeechUtterance(string: viewModel.detectedText)
                        enunciado.voice = AVSpeechSynthesisVoice(language: "pt-BR")
                        enunciado.rate = 0.3
                        sintetizador.speak(enunciado)
                    }) {
                        Text("Escutar Texto")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.indigo)
                            .foregroundStyle(.white)
                            .cornerRadius(25)
                            .padding(.horizontal)
                    }
                    ScrollView {
                        Text(viewModel.detectedText)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                } else {
                    Spacer()
                    Text("Nenhuma foto para analisar")
                        .foregroundStyle(.white)
                }
                PhotosPicker(selection: $photoPicked,
                             matching: .images,
                             photoLibrary: .shared()) {
                    Text("Pegar na Galeria")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.indigo)
                        .foregroundStyle(.white)
                        .cornerRadius(25)
                        .padding(.horizontal)
                }
                .onChange(of: photoPicked) { oldValue, newValue in
                    if let newPhoto = newValue {
                        Task {
                            if let data = try? await newPhoto.loadTransferable(type: Data.self),
                               let image = UIImage(data: data) {
                                imageToAnalise = image
                                imageFlag = true
                            }
                        }
                    }
                }
                if !imageFlag {
                    Spacer()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
