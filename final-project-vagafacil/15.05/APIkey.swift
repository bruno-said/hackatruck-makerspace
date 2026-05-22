//
//  APIkey.swift
//  15.05
//
//  Created by Turma01-13 on 18/05/26.
//
import Foundation

enum APIKey {

    static var `default`: String {
        let value = Bundle.main.object(
            forInfoDictionaryKey: "API_KEY"
        ) as? String ?? ""

        return value
    }
}

