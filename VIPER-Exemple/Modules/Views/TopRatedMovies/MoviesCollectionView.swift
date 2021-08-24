//
//  MoviesCollectionView.swift
//  VIPER-Exemple
//
//  Created by João Santos on 09/08/21.
//

import UIKit

protocol MoviesCollectionDelegate: AnyObject {
    func didTapOnMovie(id: Int)
}

class MoviesCollectionView: UICollectionView, CollectionViewType {
    
    var presenter: CollectionPresenterType?
    var delegateColection: MoviesCollectionDelegate?
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var errorView: GenericAlertView = {
        let view = GenericAlertView()
        return view
    }()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionViewLayout = self.layout
        setupCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit" + String(describing: self))
    }
    
    func didReceive() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func didReceiveError(error: String) {
        DispatchQueue.main.async {
            self.errorView.setup(With: error, fontSize: 14)
            self.addSubview(self.errorView)
            self.errorView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            self.errorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        }
    }
    
    private func setupCollection() {
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: MoviesCollectionViewCell.identifier)
        delegate = self
        dataSource = self
    }
    
}

extension MoviesCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfMovies ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionViewCell.identifier, for: indexPath) as! MoviesCollectionViewCell
        cell.setup(urlPoster: presenter!.posterUrl(index: indexPath.row), cornerRadiusValue: 18)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let id = self.presenter!.getIdMovie(at: indexPath.row)
        self.delegateColection?.didTapOnMovie(id: id)
    }
    
}

extension MoviesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.height / 1.5, height: collectionView.bounds.height * 0.9)
    }
    
}
