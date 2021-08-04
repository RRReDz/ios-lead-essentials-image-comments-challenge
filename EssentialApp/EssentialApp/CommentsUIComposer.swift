//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import UIKit
import Combine
import Foundation
import EssentialFeed
import EssentialFeediOS

public class CommentsUIComposer {
	public static func commentsComposedWith(imageCommentsLoader: @escaping () -> AnyPublisher<[ImageComment], Error>) -> ListViewController {
		let commentsController = makeFeedViewController(title: ImageCommentsPresenter.title)
		commentsController.onRefresh = {
			_ = imageCommentsLoader().sink(receiveCompletion: { _ in }, receiveValue: { _ in })
		}
		return commentsController
	}

	private static func makeFeedViewController(title: String) -> ListViewController {
		let bundle = Bundle(for: ListViewController.self)
		let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
		let feedController = storyboard.instantiateInitialViewController() as! ListViewController
		feedController.title = title
		return feedController
	}
}
