import Foundation
import SwiftData

@Model
public final class Note: Identifiable, Hashable, Equatable{

	@Attribute(.unique) public var id: UUID
	var ticket: Ticket
	var note: String
	var url: URL?
	var madeDateTime: Date
	// TODO: var Attachment: ファイル添付

	init(
		id: UUID = UUID(),
		ticket: Ticket,
		note: String = "",
		url: URL? = nil,
		madeDateTime: Date = Date()
	) {
		self.id = id
		self.ticket = ticket
		self.note = note
		self.url = url
		self.madeDateTime = madeDateTime
	}

	// 左右が等しいことをidで判断する
	public static func == (lhs: Note, rhs: Note) -> Bool {
		lhs.id == rhs.id
	}
}
