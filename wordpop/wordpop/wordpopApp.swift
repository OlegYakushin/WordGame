//
//  wordpopApp.swift
//  wordpop
//
//  Created by AhmetVural on 27.04.2022.
//

import SwiftUI

@main
struct wordpopApp: App {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
