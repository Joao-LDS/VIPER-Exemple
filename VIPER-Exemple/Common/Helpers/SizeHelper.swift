//
//  SizeHelper.swift
//  VIPER-Exemple
//
//  Created by João Santos on 05/08/21.
//

import UIKit

struct SizeHelper {
    static let size: CGSize = UIScreen.main.bounds.size
    
    static func sizeProportional(multiplierWidth: CGFloat, multiplierHeight: CGFloat) -> CGSize {
        return CGSize(width: size.width * multiplierWidth, height: size.height * multiplierHeight)
    }
}
