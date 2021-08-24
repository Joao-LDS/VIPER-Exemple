//
//  MoviesCollectionInteractor.swift
//  VIPER-Exemple
//
//  Created by João Santos on 09/08/21.
//

import Foundation

class MoviesCollectionInteractor: CollectionInteractorInputType {
    
    weak var presenter: CollectionInteractorOutputType?
    private let request: URLRequest
    
    lazy var baseSecureUrl: String = {
        let baseSecureUrl: String = UserDefaultsHelper.get(key: .baseSecureUrl) ?? ""
        return baseSecureUrl
    }()
    
    init(request: URLRequest) {
        self.request = request
    }
    
    deinit {
        print("deinit" + String(describing: self))
    }
    
    func fetchData() {
        MoviesRemote().fetchMovies(request: self.request) { [weak self] result in
            switch result {
            case .success(let movies):
                self?.presenter?.didRetrieveData(movies)
            case .failure(let error):
                self?.presenter?.didErrorRetrieveData(error: error)
            }
        }
    }
    
}
