//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation
import EssentialFeed
import EssentialFeediOS

final class ImageCommentsViewAdapter: ResourceView {
	private weak var controller: ListViewController?

	init(controller: ListViewController) {
		self.controller = controller
	}

	func display(_ viewModel: ImageCommentsViewModel) {
		controller?.display(viewModel.comments.map { commentViewModel in
			CellController(
				id: commentViewModel,
				ImageCommentCellController(viewModel: commentViewModel))
		})
	}
}
