//
//  BaseRemote.swift
//  VIPER-Exemple
//
//  Created by João Luis dos Santos on 03/08/21.
//

import Foundation

//protocol BaseRemote {
//    func request(request: URLRequest, completion: @escaping(Result<Data, NetworkError>) -> Void)
//    func decode<T: Decodable>(type: T.Type, data: Data) -> T?
//}

class BaseRemote {
    func request(request: URLRequest, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                debugPrint(error.localizedDescription)
                completion(.failure(.networkError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.httpResponseError))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.networkError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            
            completion(.success(data))
        }
        session.resume()
    }
    
    func decode<T: Decodable>(type: T.Type, data: Data) -> T? {
        do {
            let object = try JSONDecoder().decode(T.self, from: data)
            return object
        } catch let error as NSError {
            debugPrint(error.debugDescription)
            return nil
        }
    }
}
