//
//  MoviesCollectionRouter.swift
//  VIPER-Exemple
//
//  Created by João Santos on 09/08/21.
//

import UIKit

class MoviesCollectionRouter: CollectionRouterType {
    static func createModule(interactor: CollectionInteractorInputType) -> CollectionViewType {
        let view = MoviesCollectionView()
        let presenter = MoviesCollectionPresenter()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        interactor.presenter = presenter
        
        return view
    }
    
    deinit {
        print("deinit" + String(describing: self))
    }
}
