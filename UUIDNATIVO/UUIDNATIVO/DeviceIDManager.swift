//
//  DeviceIDManager.swift
//  UUIDNATIVO
//
//  Created by Administrador on 27/05/25.
//

import Foundation

class DeviceIDManager {
    private let service = "com.tuempresa.deviceid"
    private let account = "uniqueDeviceID"
    
    func getDeviceID() -> String {
        let keychain = KeychainHelper.shared
        if let data = keychain.read(service: service, account: account),
           let id = String(data: data, encoding: .utf8) {
            return id
        } else {
            let newID = UUID().uuidString
            if let data = newID.data(using: .utf8) {
                keychain.save(data, service: service, account: account)
            }
            return newID
        }
    }
}
