//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import XCTest
import EssentialApp
import EssentialFeediOS

class ImageCommentsUIIntegrationTests: XCTestCase {
	func test_imageCommentsView_hasTitle() {
		let (sut, _) = makeSUT()

		sut.loadViewIfNeeded()

		XCTAssertEqual(sut.title, commentsTitle)
	}

	// MARK: - Helpers

	private func makeSUT(
		file: StaticString = #filePath,
		line: UInt = #line
	) -> (sut: ListViewController, loader: Any) {
		let sut = CommentsUIComposer.commentsComposedWith()
		trackForMemoryLeaks(sut, file: file, line: line)
		return (sut, 1)
	}
}
