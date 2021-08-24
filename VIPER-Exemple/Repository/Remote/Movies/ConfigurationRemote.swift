//
//  ConfigurationRemote.swift
//  VIPER-Exemple
//
//  Created by João Santos on 05/08/21.
//

import Foundation

class ConfigurationRemote: BaseRemote {
    func fetchConfiguration() {
        request(request: Request.configuration.config) { result in
            switch result {
            case .success(let data):
                let configuration = self.decode(type: Configuration.self, data: data)
                UserDefaultsHelper.save(value: configuration?.configImages.secureBaseUrl, key: .baseSecureUrl)
            case .failure(let error):
                debugPrint("DEBUG: Error configuration API " + error.localizedDescription)
            }
        }
    }
}
