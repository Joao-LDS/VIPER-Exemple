//
//  GenericAlertView.swift
//  VIPER-Exemple
//
//  Created by João Santos on 17/08/21.
//

import UIKit

class GenericAlertView: UIView {

    lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(With error: String, fontSize: CGFloat) {
        errorLabel.text = error
        errorLabel.font = .boldSystemFont(ofSize: fontSize)
    }
    
}

extension GenericAlertView: ConfigureView {
    func addSubviews() {
        addSubview(errorLabel)
    }
    
    func addContraints() {
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: topAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
}
