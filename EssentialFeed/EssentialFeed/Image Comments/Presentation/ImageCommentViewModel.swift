//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

public struct ImageCommentViewModel: Equatable {
	public let username: String
	public let creation: String
	public let message: String

	public init(username: String, creation: String, message: String) {
		self.username = username
		self.creation = creation
		self.message = message
	}
}
