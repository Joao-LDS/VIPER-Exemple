//
//  Configuration.swift
//  VIPER-Exemple
//
//  Created by João Santos on 05/08/21.
//

import Foundation

struct Configuration: Decodable {
    
    let configImages: Images
    
    enum CodingKeys: String, CodingKey {
        case configImages = "images"
    }
    
    struct Images: Decodable {
        let secureBaseUrl: String
        
        enum CodingKeys: String, CodingKey {
            case secureBaseUrl = "secure_base_url"
        }
    }
    
}
