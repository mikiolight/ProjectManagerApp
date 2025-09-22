//
//  Note.swift
//  ProjectManager
//
//  Created by Mikihisa Saito on 2025/09/14.
//

import Foundation
import SwiftData

@Model
public final class Note: Identifiable, Hashable {
	@Attribute(.unique) public var id: UUID

	var ticket: Ticket

	var note: String

	var url: URL?

	var madeDateTime: Date

	// var Attachment: ファイル添付

	init(id: UUID = UUID(), ticket: Ticket,note: String = "", url: URL? = nil, madeDateTime: Date = Date()) {
		self.id = id
		self.ticket = ticket
		self.note = note
		self.url = url
		self.madeDateTime = madeDateTime
	}
}
