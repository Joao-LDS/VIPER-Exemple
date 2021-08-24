//
//  NetworkError.swift
//  VIPER-Exemple
//
//  Created by João Luis dos Santos on 04/08/21.
//

import Foundation

enum NetworkError: Error {
    case decodeError
    case dataError
    case networkError
    case httpResponseError
    
    var description: String {
        switch self {
        case .decodeError:
            return "Os dados não puderam ser recuperados."
        case .dataError:
            return "Os dados retornados são inválidos."
        case .networkError:
            return "O serviço não está disponível no momento."
        case .httpResponseError:
            return "Algo não saiu como esperado."
        }
    }
}
