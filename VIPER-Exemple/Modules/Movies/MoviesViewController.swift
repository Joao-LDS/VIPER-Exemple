//
//  MoviesViewController.swift
//  VIPER-Exemple
//
//  Created by João Santos on 03/08/21.
//

import UIKit

class MoviesViewController: UIViewController {
    
    var popularMoviesView: CollectionViewType
    var topRatedMoviesView: CollectionViewType
    let presenter = MoviesPresenter()
    
    private lazy var popularLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.text = "Popular"
        return label
    }()
    
    private lazy var topRatedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.text = "Top Rated"
        return label
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    init(popularMoviesView: CollectionViewType, topRatedMoviesView: CollectionViewType) {
        self.popularMoviesView = popularMoviesView
        self.topRatedMoviesView = topRatedMoviesView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit" + String(describing: self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        popularMoviesView.delegateColection = self
        topRatedMoviesView.delegateColection = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        popularMoviesView.presenter?.onViewDidLoad()
        topRatedMoviesView.presenter?.onViewDidLoad()
    }
    
}

extension MoviesViewController: ConfigureView {
    
    func addSubviews() {
        view.addSubview(popularLabel)
        view.addSubview(topRatedLabel)
        view.addSubview(popularMoviesView)
        view.addSubview(topRatedMoviesView)
    }
    
    func addContraints() {
        NSLayoutConstraint.activate([
            popularLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            popularLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            popularLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            popularMoviesView.topAnchor.constraint(equalTo: popularLabel.bottomAnchor),
            popularMoviesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            popularMoviesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            topRatedLabel.topAnchor.constraint(equalTo: popularMoviesView.bottomAnchor, constant: 10),
            topRatedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            topRatedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            topRatedLabel.bottomAnchor.constraint(equalTo: topRatedMoviesView.topAnchor),
            
            topRatedMoviesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            topRatedMoviesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topRatedMoviesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topRatedMoviesView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.3)
        ])
    }
}

extension MoviesViewController: MoviesCollectionDelegate {
    func didTapOnMovie(id: Int) {
        presenter.pushDetailView(id: id)
    }
}
