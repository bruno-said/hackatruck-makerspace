//
//  ContentView.swift
//  image-classify
//
//  Created by Turma01-3 on 11/05/26.
//

import SwiftUI
import CoreML
import Vision


struct ContentView: View {
    
    let imageNames = ["arara", "lobo", "barco", "arvore"]
    @State private var isShowingPicker = false
    
    @State private var selectedImageName: String = "arara"
    @State private var classificationLabel: String = "Nenhuma imagem analisade ainda"
    
    func classifyImage() {
        guard let uiImage = UIImage(named: selectedImageName),
              let ciImage = CIImage(image: uiImage) else {
            classificationLabel = "Erro ao converter imagem"
            return
        }
        
        do {
            let model = try VNCoreMLModel(
                for: MobileNetV2(configuration: MLModelConfiguration()).model
            )
            
            let request = VNCoreMLRequest(model: model) { request, error in
                if let results = request.results as? [VNClassificationObservation],
                   let topResult = results.first {
                    DispatchQueue.main.async {
                        classificationLabel = "Identificado: \(topResult.identifier) (\(String(format: "%.2f", topResult.confidence * 100))%)"
                    }
                } else {
                    classificationLabel = "Nenhum resultado encontrado"
                }
            }
            
            let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
            DispatchQueue.global().sync {
                do {
                    try handler.perform([request])
                } catch {
                    classificationLabel = "Erro na classificação: \(error.localizedDescription)"
                }
            }
            
            
            
        } catch {
            classificationLabel = "Falha ao carregar modelo ML"
        }
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            VStack {
                Text("MobileNet")
                    .foregroundStyle(.blue)
                    .bold()
                    .font(.title3)
                Text("Classificado de Imagens")
                    .font(.title)
                    .bold()
                Image(selectedImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 10)
                    )
                    .shadow(radius: 10)
                    .onTapGesture {
                        isShowingPicker = true // Abre o seletor
                    }
                Spacer(minLength: 20)
                Text("Resultado da Análise")
                    .font(.title)
                    .bold()
                Text("\(classificationLabel)")
                    .padding(10)
                    .padding(.top, 15)
                    .font(.title3)
                    .frame(width: 350, height: 200, alignment: .top)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                Spacer()
                Button(action: {
                    classifyImage()
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "cpu")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                        Text("Analisar Agora")
                            .foregroundStyle(.white)
                            .frame(height: 60)
                            .bold()
                    }
                    .frame(width: 300, height: 60)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            .padding()
            .sheet(isPresented: $isShowingPicker) {
                ImagePickerView(selectedImage: $selectedImageName, images: imageNames, isPresented: $isShowingPicker)
            }
        }
    }
}

struct ImagePickerView: View {
    @Binding var selectedImage: String
    let images: [String]
    @Binding var isPresented: Bool
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(images, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            .onTapGesture {
                                selectedImage = imageName // Define a imagem escolhida
                                isPresented = false // Fecha o seletor
                            }
                    }
                }
                .padding()
            }
            .navigationTitle("Selecione uma imagem")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
