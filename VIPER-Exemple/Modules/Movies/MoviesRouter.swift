//
//  MoviesRouter.swift
//  VIPER-Exemple
//
//  Created by João Santos on 09/08/21.
//

import UIKit

class MoviesRouter {
    static func createModule() -> UIViewController {
        let popularMoviesInteractor = MoviesCollectionInteractor(request: Request.popular.config)
        let topRatedMoviesInteractor = MoviesCollectionInteractor(request: Request.topRated.config)
        let popularMoviesView = MoviesCollectionRouter.createModule(interactor: popularMoviesInteractor)
        let topRatedMoviesView = MoviesCollectionRouter.createModule(interactor: topRatedMoviesInteractor)
        let controller = MoviesViewController(popularMoviesView: popularMoviesView,
                                              topRatedMoviesView: topRatedMoviesView)
        return controller
    }
    
    static func pushDetailView(movieId: Int) {
        
    }
}
