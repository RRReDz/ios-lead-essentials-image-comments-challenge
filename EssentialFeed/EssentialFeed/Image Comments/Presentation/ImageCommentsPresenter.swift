//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

public final class ImageCommentsPresenter {
	public static let title: String = NSLocalizedString(
		"IMAGE_COMMENTS_VIEW_TITLE",
		tableName: "ImageComments",
		bundle: Bundle(for: ImageCommentsPresenter.self),
		comment: "Title for the image comments view")

	public static func map(
		_ comments: [ImageComment],
		currentDate: Date = Date(),
		calendar: Calendar = .current,
		locale: Locale = .current
	) -> ImageCommentsViewModel {
		let formatter = RelativeDateTimeFormatter()
		formatter.locale = locale
		formatter.calendar = calendar
		return ImageCommentsViewModel(comments: comments.map {
			ImageCommentViewModel(
				username: $0.username,
				creation: formatter.localizedString(for: $0.createdAt, relativeTo: currentDate),
				message: $0.message)
		})
	}
}
