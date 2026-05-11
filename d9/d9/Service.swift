//
//  Service.swift
//  d8
//
//  Created by Turma01-3 on 28/04/26.
//

import Foundation
import Combine

struct Service {

    func fetchPessoa(url: URL) -> AnyPublisher<[Pessoa], Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Pessoa].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func postPessoa(url: URL, pessoa: Pessoa) async {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(pessoa)
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
//            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 {
//                message = "Post successful!"
//            } else {
//                message = "Failed with status code: \((response as? HTTPURLResponse)?.statusCode ?? 0)"
//            }
        } catch {
//            message =  "Error: \(error)"
        }
    }
}
