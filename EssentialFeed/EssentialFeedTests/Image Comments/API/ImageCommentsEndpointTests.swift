//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeed

class ImageCommentsEndpointTests: XCTestCase {
	func test_comments_endpointURL() {
		let baseURL = URL(string: "http://base-url.com")!

		let commentsId = UUID(uuidString: "11E123D5-1272-4F17-9B91-F3D0FFEC895A")!
		let received = ImageCommentsEndpoint.get(commentsId).url(baseURL: baseURL)
		let expected = URL(string: "http://base-url.com/v1/image/11E123D5-1272-4F17-9B91-F3D0FFEC895A/comments")!

		XCTAssertEqual(received, expected)
	}
}
