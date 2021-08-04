//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import UIKit
import EssentialFeed

public class ImageCommentCellController: NSObject {
	private let viewModel: ImageCommentViewModel

	public init(viewModel: ImageCommentViewModel) {
		self.viewModel = viewModel
	}
}

extension ImageCommentCellController: UITableViewDataSource {
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell() as ImageCommentCell
		cell.usernameLabel.text = viewModel.username
		cell.dateLabel.text = viewModel.creation
		cell.messageLabel.text = viewModel.message
		return cell
	}
}
