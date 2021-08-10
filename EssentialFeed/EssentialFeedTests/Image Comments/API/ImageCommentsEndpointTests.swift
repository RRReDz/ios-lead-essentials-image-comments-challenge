//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeed

class ImageCommentsEndpointTests: XCTestCase {
	func test_comments_endpointURL() {
		let baseURL = URL(string: "http://base-url.com")!

		let commentsIdString = "11E123D5-1272-4F17-9B91-F3D0FFEC895A"
		let commentsId = UUID(uuidString: commentsIdString)!
		let received = ImageCommentsEndpoint.get(commentsId).url(baseURL: baseURL)
		let expected = URL(string: "http://base-url.com/v1/image/\(commentsIdString)/comments")!

		XCTAssertEqual(received, expected)
	}
}
