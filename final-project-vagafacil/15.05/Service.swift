//
//  Service.swift
//  d8
//
//  Created by Turma01-3 on 28/04/26.
//

import Foundation
import Combine

struct Service {
    
    func vagaLeitura(url: URL) -> AnyPublisher<[Vaga], Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Vaga].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func vagaEnvio(url: URL, vaga: Vaga) async {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(vaga)
            let (_, _) = try await URLSession.shared.data(for: request)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func chatLeitura(url: URL) -> AnyPublisher<[Chat], Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Chat].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func chatEnvio(url: URL, vaga: Chat) async {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(vaga)
            let (_, _) = try await URLSession.shared.data(for: request)
        } catch {
            print("Error: \(error)")
        }
    }
}
