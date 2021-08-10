//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeediOS
import EssentialFeed

class ImageCommentsSnapshotTests: XCTestCase {
	func test_imageCommentsWithContent() {
		let sut = makeSUT()

		sut.display(imageCommentsWithContent())

		assert(snapshot: sut.snapshot(for: .iPhone8(style: .light)), named: "IMAGE_COMMENTS_WITH_CONTENT_light")
		assert(snapshot: sut.snapshot(for: .iPhone8(style: .dark)), named: "IMAGE_COMMENTS_WITH_CONTENT_dark")
		assert(snapshot: sut.snapshot(for: .iPhone8(style: .light, contentSize: .extraExtraExtraLarge)), named: "IMAGE_COMMENTS_WITH_CONTENT_light_extraExtraExtraLarge")
	}

	private func imageCommentsWithContent() -> [CellController] {
		return [
			CellController(id: UUID(), ImageCommentCellController(
				viewModel: ImageCommentViewModel(
					username: "A username",
					creation: "2 weeks ago",
					message: "This is just a comment that will reach like two lines of text.")
			)),
			CellController(id: UUID(), ImageCommentCellController(
				viewModel: ImageCommentViewModel(
					username: "A very very very very very very very long username",
					creation: "1 day ago",
					message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer non posuere ex. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas tristique interdum nulla, at tempus magna interdum sed. Quisque venenatis urna nec libero pulvinar, quis laoreet sapien fermentum.")
			)),
			CellController(id: UUID(), ImageCommentCellController(
				viewModel: ImageCommentViewModel(
					username: "A u.",
					creation: "1 second ago",
					message: "🤪")
			))
		]
	}

	private func makeSUT() -> ListViewController {
		let bundle = Bundle(for: ListViewController.self)
		let storyboard = UIStoryboard(name: "ImageComments", bundle: bundle)
		let controller = storyboard.instantiateInitialViewController() as! ListViewController
		controller.loadViewIfNeeded()
		controller.tableView.showsVerticalScrollIndicator = false
		controller.tableView.showsHorizontalScrollIndicator = false
		return controller
	}
}
