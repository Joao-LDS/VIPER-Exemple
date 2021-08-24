//
//  MoviesCollectionPresenter.swift
//  VIPER-Exemple
//
//  Created by João Santos on 09/08/21.
//

import Foundation

class MoviesCollectionPresenter: CollectionPresenterType, CollectionInteractorOutputType {
    
    weak var view: CollectionViewType?
    var interactor: CollectionInteractorInputType?
    weak var router: CollectionRouterType?
    var movies: Movies?
    
    var numberOfMovies: Int {
        return movies?.movies.count ?? 0
    }
    
    deinit {
        print("deinit" + String(describing: self))
    }
    
    func onViewDidLoad() {
        interactor?.fetchData()
    }
    
    func didRetrieveData<T>(_ object: T) {
        if let movies = object as? Movies {
            self.movies = movies
            view?.didReceive()
        }
    }
    
    func didErrorRetrieveData(error: Error) {
        guard let error = error as? NetworkError else {
            return
        }
        view?.didReceiveError(error: error.description)
    }
    
    func posterUrl(index: Int) -> URL {
        let baseSecureUrl = interactor?.baseSecureUrl ?? ""
        let posterUrl = movies?.movies[index].posterPath ?? ""
        return URL(string: baseSecureUrl + "w500" + posterUrl)!
    }
    
    func getIdMovie(at index: Int) -> Int {
        guard let movies = self.movies else {
            return 0
        }
        return movies.movies[index].id
    }
}
