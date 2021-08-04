//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import Combine
import Foundation
import EssentialFeed

extension ImageCommentsUIIntegrationTests {
	class LoaderSpy {
		var loadImageCommentsCallCount: Int { commentsRequests.count }

		private var commentsRequests = [PassthroughSubject<[ImageComment], Error>]()

		func loadPublisher() -> AnyPublisher<[ImageComment], Error> {
			let publisher = PassthroughSubject<[ImageComment], Error>()
			commentsRequests.append(publisher)
			return publisher.eraseToAnyPublisher()
		}

		func completeImageCommentsLoading(with comments: [ImageComment] = [], at index: Int = 0) {
			commentsRequests[index].send(comments)
		}

		func completeImageCommentsLoadingWithError(at index: Int = 0) {
			let error = NSError(domain: "an error", code: 0)
			commentsRequests[index].send(completion: .failure(error))
		}
	}
}
