//
//  ModelDocument.swift
//  VerySimpleCodable
//
//  Created by Deirdre Saoirse Moen on 12/23/21.
//

import SwiftUI
import UniformTypeIdentifiers
import Combine

extension UTType {
	static var jsonFile: UTType {
		UTType(importedAs: "public.json")
	}
}

final class Store: ObservableObject, ReferenceFileDocument {
	typealias Snapshot = [Thing]

	// has to be a class because of @Published
	@Published var things: [Thing] = []

	// hack around the need for previews to have a static rather than instance var
	static let shared = Store()
	
	// required for FileDocument conformance
	static var readableContentTypes = [UTType.jsonFile]

	// what it's called
	private var filename = "database.json"

	/// Required methods for conformance
	convenience init(configuration: ReadConfiguration) throws {
		self.init()
	}

	func snapshot(contentType: UTType) throws -> Snapshot {
		things
	}

	func fileWrapper(snapshot: Snapshot, configuration: WriteConfiguration) throws -> FileWrapper {
		var exportedData = Data()
		// TODO: append to your data here
		return FileWrapper(regularFileWithContents: exportedData)
	}

	/// Load Thing items here.
	private func loadThings(from storeFileData: Data) -> [Thing] {
		do {
			let decoder = JSONDecoder()
			return try decoder.decode([Thing].self, from: storeFileData)
		} catch {
			print(error)
			return []
		}
	}

	/// Initialize things. :)
	init() {
		// look inside the app's bundle for the file
		if let bundledDatabaseUrl = Bundle.main.url(forResource: "database", withExtension: "json") {
			// read contents of the file
			if let data = FileManager.default.contents(atPath: bundledDatabaseUrl.path) {
				// now stuff those contents into an array of the model
				things = loadThings(from: data)
			}
		} else {
			things = []
		}
	}
}
