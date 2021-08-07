//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeed

class ImageCommentsEndpointTests: XCTestCase {
	func test_comments_endpointURL() {
		let baseURL = URL(string: "http://base-url.com")!

		let feedId = UUID()
		let received = ImageCommentsEndpoint.get(feedId).url(baseURL: baseURL)
		let expected = URL(string: "http://base-url.com/v1/image/\(feedId)/comments")!

		XCTAssertEqual(received, expected)
	}
}
