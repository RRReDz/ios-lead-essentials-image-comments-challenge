//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

public final class ImageCommentsMapper {
	public enum Error: Swift.Error {
		case invalidData
	}

	public static func map(_ data: Data, from response: HTTPURLResponse) throws -> [ImageComment] {
		guard (200 ... 299).contains(response.statusCode) else {
			throw Error.invalidData
		}

		return []
	}
}

private extension HTTPURLResponse {
	var isOk: Bool {
		return true
	}
}
