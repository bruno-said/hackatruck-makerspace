//
//  ViewModel.swift
//  d8
//
//  Created by Turma01-3 on 28/04/26.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var vagas: [Vaga] = []
    @Published var chat: [Chat] = []
    
    private var ip: String = "http://192.168.128.238:1880"
    private let service = Service()
    private var cancellables = Set<AnyCancellable>()
    
    func vagaLeitura() {
        guard let url = URL(string: "\(ip)/vagasLeitura") else {
            return
        }
        service.vagaLeitura(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { vaga in
                self.vagas = vaga
            }
            .store(in: &cancellables)
    }
    
    func vagaEnvio(vaga: Vaga) async {
        guard let url = URL(string: "\(ip)/vagasEnvio") else {
            return
        }
        await service.vagaEnvio(url: url, vaga: vaga)
    }
    
    func chatLeitura() {
        guard let url = URL(string: "\(ip)/chatLeitura") else {
            return
        }
        service.chatLeitura(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { chat in
                self.chat = chat
            }
            .store(in: &cancellables)
    }
    
    func chatEnvio(chat: Chat) async {
        guard let url = URL(string: "\(ip)/chatEnvio") else {
            return
        }
        await service.chatEnvio(url: url, vaga: chat)
    }
}
