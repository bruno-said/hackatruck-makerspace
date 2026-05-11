//
//  ViewModel.swift
//  d8
//
//  Created by Turma01-3 on 28/04/26.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var pessoas: [Pessoa] = []
    
    private let service = Service()
    private var cancellables = Set<AnyCancellable>()
    
    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/leitura") else {
            return
        }
        service.fetchPessoa(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { pessoas in
                self.pessoas = pessoas
            }
            .store(in: &cancellables)
    }
    
    func post(pessoa: Pessoa) async {
        guard let url = URL(string: "http://127.0.0.1:1880/envio") else {
            return
        }
        await service.postPessoa(url: url, pessoa: pessoa)
    }
}
