//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

public class ImageCommentsPresenter {
	public static let title: String = NSLocalizedString(
		"IMAGE_COMMENTS_VIEW_TITLE",
		tableName: "ImageComments",
		bundle: Bundle(for: ImageCommentsPresenter.self),
		comment: "Title for the image comments view")

	public static func map(_ comments: [ImageComment]) -> ImageCommentsViewModel {
		ImageCommentsViewModel(comments: comments)
	}
}