//
//  APIKey.swift
//  d12
//
//  Created by Turma01-3 on 08/05/26.
//

import Foundation

enum APIKey {

    static var `default`: String {
        let value = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
        print(value)
        return value
    }
}
