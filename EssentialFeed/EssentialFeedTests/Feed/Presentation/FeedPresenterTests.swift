//
//  Copyright © 2019 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeed

class FeedPresenterTests: XCTestCase {
	func test_title_isLocalized() {
		XCTAssertEqual(FeedPresenter.title, localized("FEED_VIEW_TITLE", inTable: "Feed", for: FeedPresenter.self))
	}

	func test_map_createsViewModel() {
		let feed = uniqueImageFeed().models

		let viewModel = FeedPresenter.map(feed)

		XCTAssertEqual(viewModel.feed, feed)
	}
}
