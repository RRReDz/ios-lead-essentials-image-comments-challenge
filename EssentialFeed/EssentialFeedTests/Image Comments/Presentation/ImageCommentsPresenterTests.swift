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
		let imageComments = [
			ImageComment(id: UUID(), message: "any message", createdAt: Date().adding(minutes: -5), username: "any username"),
			ImageComment(id: UUID(), message: "another message", createdAt: Date().adding(days: -1), username: "another username")
		]

		let viewModel = ImageCommentsPresenter.map(imageComments)

		XCTAssertEqual(viewModel.comments, [
			ImageCommentViewModel(username: "any username", creation: "5 minutes ago", message: "any message"),
			ImageCommentViewModel(username: "another username", creation: "1 day ago", message: "another message")
		])
	}
}
