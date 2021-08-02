//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeed

class ImageCommentsMapperTests: XCTestCase {
	func test_map_throwsErrorOnNon2xxHTTPResponse() throws {
		let json = makeItemsJSON([])
		let samples = [199, 300, 400, 500]

		try samples.forEach { code in
			XCTAssertThrowsError(
				try ImageCommentsMapper.map(json, from: HTTPURLResponse(statusCode: code))
			)
		}
	}

	func test_map_throwsErrorOn2xxHTTPResponseWithInvalidJSON() throws {
		let invalidJSON = Data("invalid json".utf8)
		let samples = [200, 201, 250, 299]

		try samples.forEach { code in
			XCTAssertThrowsError(
				try ImageCommentsMapper.map(invalidJSON, from: HTTPURLResponse(statusCode: code))
			)
		}
	}

	func test_map_deliversNoItemsOn2xxHTTPResponseWithEmptyJSONList() throws {
		let emptyListJSON = makeItemsJSON([])
		let samples = [200, 201, 250, 299]

		try samples.forEach { code in
			let result = try ImageCommentsMapper.map(emptyListJSON, from: HTTPURLResponse(statusCode: code))

			XCTAssertEqual(result, [])
		}
	}
}
