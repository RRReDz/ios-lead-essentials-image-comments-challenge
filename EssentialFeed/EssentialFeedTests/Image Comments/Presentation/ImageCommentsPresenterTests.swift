//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeed

class ImageCommentsPresenterTests: XCTestCase {
	func test_title_isLocalized() {
		XCTAssertEqual(
			ImageCommentsPresenter.title,
			localized(
				"IMAGE_COMMENTS_VIEW_TITLE",
				inTable: "ImageComments",
				for: ImageCommentsPresenter.self))
	}

	func test_map_createsViewModel() {
		let imageComments = uniqueImageComments()

		let viewModel = ImageCommentsPresenter.map(imageComments)

		XCTAssertEqual(viewModel.comments, imageComments)
	}

	// MARK: - Helpers

	private func uniqueImageComments() -> [ImageComment] {
		return [
			ImageComment(id: UUID(), message: "any message", createdAt: Date().adding(seconds: -60), author: "any author"),
			ImageComment(id: UUID(), message: "another message", createdAt: Date().adding(days: -10), author: "any author")
		]
	}
}
