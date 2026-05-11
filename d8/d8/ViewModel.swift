//
//  ViewModel.swift
//  d8
//
//  Created by Turma01-3 on 28/04/26.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var personagens: [HaPo] = []
    
    private let service = Service()
    private var cancellables = Set<AnyCancellable>()
    
    func fetch() {
        guard let url = URL(string: "https://potterhead-api.vercel.app/api/characters") else {
            return
        }
        service.fetchHaPo(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { personagens in
                self.personagens = personagens
            }
            .store(in: &cancellables)
    }
}
