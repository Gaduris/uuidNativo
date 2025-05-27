//
//  ContentView.swift
//  UUIDNATIVO
//
//  Created by Administrador on 27/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var deviceID: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("ID Único del Dispositivo:")
                .font(.headline)
            Text(deviceID)
                .font(.footnote)
                .padding()
                .multilineTextAlignment(.center)
                .contextMenu {
                    Button(action: {
                        UIPasteboard.general.string = deviceID
                    }) {
                        Label("Copiar", systemImage: "doc.on.doc")
                    }
                }
        }
        .padding()
        .onAppear {
            let manager = DeviceIDManager()
            self.deviceID = manager.getDeviceID()
        }
    }
}


