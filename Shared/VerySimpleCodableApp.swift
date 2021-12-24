//
//  VerySimpleCodableApp.swift
//  Shared
//
//  Created by Deirdre Saoirse Moen on 12/23/21.
//

import SwiftUI

@main
struct VerySimpleCodableApp: App {

	@StateObject private var store = Store()

	var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(store)
        }
    }
}
