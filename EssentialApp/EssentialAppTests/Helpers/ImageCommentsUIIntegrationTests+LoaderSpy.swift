//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import Combine
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
	}
}
