//
//  ViewModel.swift
//  vision
//
//  Created by Turma01-3 on 12/05/26.
//

import Foundation
import Vision
import UIKit
import Combine


class ViewModel: ObservableObject {
    @Published var detectedText: String = ""
    
    @MainActor func detect(photo: UIImage?) async {
        let request = RecognizeDocumentsRequest()
        guard let image = photo else { return }
        guard let cgImage = image.cgImage else { return }
        //    let result = try? await request.perform(on: cgImage)
        do {
            let result = try await request.perform(on: cgImage)
            let item = result.first?.document.text
            detectedText = item?.transcript ?? "teste"
        } catch {
            print(error)
        }
    }
}
