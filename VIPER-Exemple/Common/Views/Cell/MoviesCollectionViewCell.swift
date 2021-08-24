//
//  MoviesCollectionViewCell.swift
//  VIPER-Exemple
//
//  Created by João Santos on 05/08/21.
//

import UIKit
import Kingfisher

class MoviesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MoviesCollectionViewCell"
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showLoading() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    private func addCornerRadius(value: CGFloat) {
        imageView.layer.cornerRadius = value
        imageView.layer.masksToBounds = true
    }
    
    func setup(urlPoster: URL, cornerRadiusValue: CGFloat?) {
        showLoading()
        if let cornerRadiusValue = cornerRadiusValue {
            addCornerRadius(value: cornerRadiusValue)
        }
        imageView.kf.setImage(with: urlPoster) { result in
            switch result {
            case .success(_):
                self.hideLoading()
            case .failure(_):
                break
            }
        }
    }

}

extension MoviesCollectionViewCell: ConfigureView {
    
    func addSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(activityIndicator)
    }
    
    func addContraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}
