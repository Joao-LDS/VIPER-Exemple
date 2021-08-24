//
//  MoviesRemote.swift
//  VIPER-Exemple
//
//  Created by João Luis dos Santos on 03/08/21.
//

import Foundation

class MoviesRemote: BaseRemote {
    func fetchMovies(request: URLRequest, completion: @escaping(Result<Movies?, NetworkError>) -> Void) {
        self.request(request: request) { result in
            switch result {
            case .success(let data):
                if let movies = self.decode(type: Movies.self, data: data) {
                    completion(.success(movies))
                } else {
                    completion(.failure(.decodeError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
