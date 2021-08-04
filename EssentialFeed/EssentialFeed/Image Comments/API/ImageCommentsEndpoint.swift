//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

public enum ImageCommentsEndpoint {
	case get(_ feedId: String)

	public func url(baseURL: URL) -> URL {
		switch self {
		case let .get(feedId):
			return baseURL.appendingPathComponent("/v1/image/\(feedId)/comments")
		}
	}
}
