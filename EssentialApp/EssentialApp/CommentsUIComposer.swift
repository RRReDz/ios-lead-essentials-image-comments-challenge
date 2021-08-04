//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import UIKit
import Combine
import Foundation
import EssentialFeed
import EssentialFeediOS

public class CommentsUIComposer {
	private typealias ImageCommentsPresentationAdapter = LoadResourcePresentationAdapter<[ImageComment], ImageCommentsViewAdapter>

	public static func commentsComposedWith(imageCommentsLoader: @escaping () -> AnyPublisher<[ImageComment], Error>) -> ListViewController {
		let commentsController = makeImageCommentsViewController(title: ImageCommentsPresenter.title)

		let presentationAdapter = ImageCommentsPresentationAdapter(loader: imageCommentsLoader)

		presentationAdapter.presenter = LoadResourcePresenter(
			resourceView: ImageCommentsViewAdapter(),
			loadingView: WeakRefVirtualProxy(commentsController),
			errorView: WeakRefVirtualProxy(commentsController),
			mapper: { ImageCommentsPresenter.map($0) })

		commentsController.onRefresh = presentationAdapter.loadResource

		return commentsController
	}

	private static func makeImageCommentsViewController(title: String) -> ListViewController {
		let bundle = Bundle(for: ListViewController.self)
		let storyboard = UIStoryboard(name: "ImageComments", bundle: bundle)
		let imageCommentsController = storyboard.instantiateInitialViewController() as! ListViewController
		imageCommentsController.title = title
		return imageCommentsController
	}
}
