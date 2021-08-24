//
//  DetailMovieProtocol.swift
//  VIPER-Exemple
//
//  Created by João Santos on 24/08/21.
//

import Foundation

protocol DetailMovieViewType: UICollectionView {
    var presenter: DetailMoviePresenterType? { get set }
    func didReceive()
    func didReceiveError(error: String)
}

protocol DetailMoviePresenterType: AnyObject {
    var view: DetailMovieViewType? { get set }
    var interactor: DetailMovieInteractorInputType? { get set }
    var router: CollectionRouterType? { get set }
    var numberOfMovies: Int { get }
    func onViewDidLoad()
    func posterUrl(index: Int) -> URL
    func getIdMovie(at index: Int) -> Int
}

protocol DetailMovieInteractorInputType: AnyObject {
    var presenter: CollectionInteractorOutputType? { get set }
    var baseSecureUrl: String { get }
    func fetchData()
}

protocol DetailMovieRouterType: AnyObject {
    static func createModule(interactor: CollectionInteractorInputType) -> CollectionViewType
}

protocol DetailMovieInteractorOutputType: AnyObject {
    func didRetrieveData<T>(_ object: T)
    func didErrorRetrieveData(error: Error)
}
