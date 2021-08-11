//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

public enum ImageCommentsEndpoint {
	case get(_ imageId: UUID)

	public func url(baseURL: URL) -> URL {
		switch self {
		case let .get(imageId):
			return baseURL.appendingPathComponent("/v1/image/\(imageId)/comments")
		}
	}
}
