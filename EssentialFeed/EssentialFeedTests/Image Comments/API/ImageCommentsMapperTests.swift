//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeed

class ImageCommentsMapperTests: XCTestCase {
	func test_map_throwsErrorOnNon2xxHTTPResponse() throws {
		let json = makeItemsJSON([])
		let non2xxSamples = [199, 300, 400, 500]

		assert(forEach: non2xxSamples, with: json, toGetResult: .failure(anyNSError()))
	}

	func test_map_throwsErrorOn2xxHTTPResponseWithInvalidJSON() throws {
		let invalidJSON = Data("invalid json".utf8)

		assert(forEach: samples2xx, with: invalidJSON, toGetResult: .failure(anyNSError()))
	}

	func test_map_deliversNoItemsOn2xxHTTPResponseWithEmptyJSONList() throws {
		let emptyListJSON = makeItemsJSON([])

		assert(forEach: samples2xx, with: emptyListJSON, toGetResult: .success([]))
	}

	func test_map_deliversItemsOn200HTTPResponseWithJSONItems() throws {
		let item1 = try makeItem(
			id: UUID(),
			message: "any message",
			createdAt: Date(timeIntervalSince1970: 1596386109000),
			author: "any author")

		let item2 = try makeItem(
			id: UUID(),
			message: "another message",
			createdAt: Date(timeIntervalSince1970: 1617381309000),
			author: "another author")

		let json = makeItemsJSON([item1.json, item2.json])

		assert(forEach: samples2xx, with: json, toGetResult: .success([item1.model, item2.model]))
	}

	//MARK: - Utils

	private let samples2xx = [200, 201, 250, 299]

	private func assert(
		forEach statusCodes: [Int],
		with data: Data,
		toGetResult expectedResult: Result<[ImageComment], Error>,
		file: StaticString = #filePath,
		line: UInt = #line
	) {
		statusCodes.forEach { code in
			let receivedResult = Result<[ImageComment], Error> {
				try ImageCommentsMapper.map(data, from: HTTPURLResponse(statusCode: code))
			}

			switch (expectedResult, receivedResult) {
			case (.failure, .failure):
				break
			case (let .success(expectedComments), let .success(receivedComments)):
				XCTAssertEqual(expectedComments, receivedComments, file: file, line: line)
			default:
				XCTFail("Expected \(expectedResult), got \(receivedResult) instead", file: file, line: line)
			}
		}
	}

	private func makeItem(id: UUID, message: String, createdAt: Date, author: String) throws -> (model: ImageComment, json: [String: Any]) {
		let item = ImageComment(id: id, message: message, createdAt: createdAt, username: author)

		let json: [String: Any] = [
			"id": id.uuidString,
			"message": message,
			"created_at": ISO8601DateFormatter().string(from: createdAt),
			"author": [
				"username": author
			]
		]

		return (item, json)
	}
}
