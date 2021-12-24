//
//  Model.swift
//  VerySimpleCodable
//
//  Created by Deirdre Saoirse Moen on 12/23/21.
//

import SwiftUI
import UniformTypeIdentifiers
import Combine

struct Thing: Decodable {
	// tell your app what to expect when decoding this model
	private enum CodingKeys: String, CodingKey {
		case name
		case icon
	}

	// variables corresponding to above (usually)
	var name: String
	var icon: String

	/// Required init for Decodable conformance
	public init(from decoder: Decoder) throws {
		// create container
		let container = try decoder.container(keyedBy: CodingKeys.self)
		// and start decoding
		self.name = try container.decode(String.self, forKey: .name)
		self.icon = try container.decode(String.self, forKey: .icon)
	}
}
