//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import XCTest
import EssentialApp
import EssentialFeed
import EssentialFeediOS

class ImageCommentsUIIntegrationTests: XCTestCase {
	func test_imageCommentsView_hasTitle() {
		let (sut, _) = makeSUT()

		sut.loadViewIfNeeded()

		XCTAssertEqual(sut.title, commentsTitle)
	}

	func test_loadImageCommentsActions_requestImageCommentsFromLoader() {
		let (sut, loader) = makeSUT()
		XCTAssertEqual(loader.loadImageCommentsCallCount, 0, "Expected no loading requests before view is loaded")

		sut.loadViewIfNeeded()
		XCTAssertEqual(loader.loadImageCommentsCallCount, 1, "Expected a loading request once view is loaded")

		sut.simulateUserInitiatedReload()
		XCTAssertEqual(loader.loadImageCommentsCallCount, 2, "Expected another loading request once user initiates a reload")

		sut.simulateUserInitiatedReload()
		XCTAssertEqual(loader.loadImageCommentsCallCount, 3, "Expected yet another loading request once user initiates another reload")
	}

	func test_loadingImageCommentsIndicator_isVisibleWhileLoadingImageComments() {
		let (sut, loader) = makeSUT()

		sut.loadViewIfNeeded()
		XCTAssertTrue(sut.isShowingLoadingIndicator, "Expected loading indicator once view is loaded")

		loader.completeImageCommentsLoading(at: 0)
		XCTAssertFalse(sut.isShowingLoadingIndicator, "Expected no loading indicator once loading completes successfully")

		sut.simulateUserInitiatedReload()
		XCTAssertTrue(sut.isShowingLoadingIndicator, "Expected loading indicator once user initiates a reload")

		loader.completeImageCommentsLoadingWithError(at: 1)
		XCTAssertFalse(sut.isShowingLoadingIndicator, "Expected no loading indicator once user initiated loading completes with error")
	}

	func test_loadImageCommentsCompletion_rendersSuccessfullyLoadedImageComments() {
		let comment0 = makeImageComment(
			message: "any message",
			createdAt: Date(timeIntervalSince1970: 1596386109000),
			username: "any username")
		let comment1 = makeImageComment(
			message: "another message",
			createdAt: Date(timeIntervalSince1970: 1617381309000),
			username: "another username")
		let (sut, loader) = makeSUT()

		sut.loadViewIfNeeded()
		assertThat(sut, isRendering: [])

		loader.completeImageCommentsLoading(with: [comment0, comment1], at: 0)
		let viewModels = ImageCommentsPresenter.map([comment0, comment1]).comments
		assertThat(sut, isRendering: viewModels)
	}

	func test_loadImageCommentsCompletion_rendersSuccessfullyLoadedEmptyCommentsAfterNonEmptyComments() {
		let comment0 = makeImageComment(
			message: "any message",
			createdAt: Date(timeIntervalSince1970: 1596386109000),
			username: "any username")
		let comment1 = makeImageComment(
			message: "another message",
			createdAt: Date(timeIntervalSince1970: 1617381309000),
			username: "another username")
		let (sut, loader) = makeSUT()

		sut.loadViewIfNeeded()
		loader.completeImageCommentsLoading(with: [comment0, comment1], at: 0)
		let viewModels = ImageCommentsPresenter.map([comment0, comment1]).comments
		assertThat(sut, isRendering: viewModels)

		sut.simulateUserInitiatedReload()
		loader.completeImageCommentsLoading(with: [], at: 1)
		assertThat(sut, isRendering: [])
	}

	// MARK: - Helpers

	private func makeSUT(
		file: StaticString = #filePath,
		line: UInt = #line
	) -> (sut: ListViewController, loader: LoaderSpy) {
		let loader = LoaderSpy()
		let sut = CommentsUIComposer.commentsComposedWith(
			imageCommentsLoader: loader.loadPublisher
		)
		trackForMemoryLeaks(sut, file: file, line: line)
		trackForMemoryLeaks(loader, file: file, line: line)
		return (sut, loader)
	}

	private func makeImageComment(message: String = "any message", createdAt: Date = Date(), username: String = "any username") -> ImageComment {
		return ImageComment(
			id: UUID(),
			message: message,
			createdAt: createdAt,
			username: username)
	}
}
