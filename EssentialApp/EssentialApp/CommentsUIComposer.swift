//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import UIKit
import Foundation
import EssentialFeed
import EssentialFeediOS

public class CommentsUIComposer {
	public static func commentsComposedWith() -> ListViewController {
		return makeFeedViewController(title: ImageCommentsPresenter.title)
	}

	private static func makeFeedViewController(title: String) -> ListViewController {
		let bundle = Bundle(for: ListViewController.self)
		let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
		let feedController = storyboard.instantiateInitialViewController() as! ListViewController
		feedController.title = title
		return feedController
	}
}
