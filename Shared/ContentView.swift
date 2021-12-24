//
//  ContentView.swift
//  Shared
//
//  Created by Deirdre Saoirse Moen on 12/23/21.
//

import SwiftUI

struct ContentView: View {

	// this is passed in from the App in the real app, and from the PreviewProvider in the previews
	@EnvironmentObject var store: Store

	var body: some View {
		ForEach(store.things, id: \.name) { thing in
			Label(thing.name, systemImage: thing.icon)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
	@StateObject static var store = Store.shared
    static var previews: some View {
        ContentView()
			.environmentObject(store)
    }
}
