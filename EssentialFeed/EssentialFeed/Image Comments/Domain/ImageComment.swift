//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

public struct ImageComment {
	private let id: UUID
	private let message: String
	private let createdAt: Date
	private let author: String

	public init(id: UUID, message: String, createdAt: Date, author: String) {
		self.id = id
		self.message = message
		self.createdAt = createdAt
		self.author = author
	}
}
