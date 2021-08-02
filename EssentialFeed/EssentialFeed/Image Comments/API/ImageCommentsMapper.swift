//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

public final class ImageCommentsMapper {
	private struct Root: Decodable {
		private let items: [RemoteImageComment]

		private struct RemoteImageComment: Decodable {
			let id: UUID
			let message: String
			let createdAt: Date
			let author: Author

			private enum CodingKeys: String, CodingKey {
				case id
				case message
				case createdAt = "created_at"
				case author
			}

			struct Author: Decodable {
				let username: String
			}
		}

		var comments: [ImageComment] {
			items.map {
				ImageComment(
					id: $0.id,
					message: $0.message,
					createdAt: $0.createdAt,
					author: $0.author.username)
			}
		}
	}

	public enum Error: Swift.Error {
		case invalidData
	}

	public static func map(_ data: Data, from response: HTTPURLResponse) throws -> [ImageComment] {
		guard (200 ... 299).contains(response.statusCode), let _ = try? JSONDecoder().decode(Root.self, from: data) else {
			throw Error.invalidData
		}

		return []
	}
}

private extension HTTPURLResponse {
	var isOk: Bool {
		return true
	}
}
