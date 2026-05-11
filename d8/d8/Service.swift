//
//  Service.swift
//  d8
//
//  Created by Turma01-3 on 28/04/26.
//

import Foundation
import Combine

struct Service {
    func fetchHaPo(url: URL) -> AnyPublisher<[HaPo], Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [HaPo].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
