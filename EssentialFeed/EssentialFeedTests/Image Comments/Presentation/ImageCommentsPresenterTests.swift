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
		let now = Date()
		let calendar = Calendar(identifier: .gregorian)
		let locale = Locale(identifier: "en_US_POSIX")

		let imageComments = [
			ImageComment(id: UUID(), message: "any message", createdAt: now.adding(minutes: -5, calendar: calendar), username: "any username"),
			ImageComment(id: UUID(), message: "another message", createdAt: now.adding(days: -1, calendar: calendar), username: "another username")
		]

		let viewModel = ImageCommentsPresenter.map(imageComments, currentDate: now, calendar: calendar, locale: locale)

		XCTAssertEqual(viewModel.comments, [
			ImageCommentViewModel(username: "any username", creation: "5 minutes ago", message: "any message"),
			ImageCommentViewModel(username: "another username", creation: "1 day ago", message: "another message")
		])
	}
}
