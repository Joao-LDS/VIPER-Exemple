//
//  MoviesCollectionProtocol.swift
//  VIPER-Exemple
//
//  Created by João Santos on 09/08/21.
//

import UIKit

protocol CollectionViewType: UICollectionView {
    var presenter: CollectionPresenterType? { get set }
    var delegateColection: MoviesCollectionDelegate? { get set }
    func didReceive()
    func didReceiveError(error: String)
}

protocol CollectionPresenterType: AnyObject {
    var view: CollectionViewType? { get set }
    var interactor: CollectionInteractorInputType? { get set }
    var router: CollectionRouterType? { get set }
    var numberOfMovies: Int { get }
    func onViewDidLoad()
    func posterUrl(index: Int) -> URL
    func getIdMovie(at index: Int) -> Int
}

protocol CollectionInteractorInputType: AnyObject {
    var presenter: CollectionInteractorOutputType? { get set }
    var baseSecureUrl: String { get }
    func fetchData()
}

protocol CollectionRouterType: AnyObject {
    static func createModule(interactor: CollectionInteractorInputType) -> CollectionViewType
}

protocol CollectionInteractorOutputType: AnyObject {
    func didRetrieveData<T>(_ object: T)
    func didErrorRetrieveData(error: Error)
}
