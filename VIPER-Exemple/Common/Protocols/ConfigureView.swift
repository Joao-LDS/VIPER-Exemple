//
//  ConfigureView.swift
//  VIPER-Exemple
//
//  Created by João Santos on 05/08/21.
//

import Foundation

protocol ConfigureView {
    func addSubviews()
    func addContraints()
    func setupView()
}

extension ConfigureView {
    func setupView() {
        addSubviews()
        addContraints()
    }
}
