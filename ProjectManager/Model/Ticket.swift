import Foundation
import SwiftData

@Model
public final class Ticket: Identifiable, Hashable{
	@Attribute(.unique) public var id: UUID

	var project: Project

	var ticketName: String

	var ticketDetail: String?

	var startDate: Date?

	var dueDate: Date?

	var completeDate: Date?

	var status: TicketStatus

	@Relationship(deleteRule: .cascade ,inverse: \Note.ticket)

	var notes: [Note] = []

	init(
		id: UUID = UUID(),
		project: Project,
		ticketName: String,
		ticketDetail: String? = "",
		startDate: Date? = Date(),
		dueDate: Date?,
		completeDate: Date?,
		status: TicketStatus = .notStarted
	) {
		self.id = id
		self.project = project
		self.ticketName = ticketName
		self.ticketDetail = ticketDetail
		self.startDate = startDate
		self.dueDate = dueDate
		self.completeDate = completeDate
		self.status = status
	}
}

enum TicketStatus: String, CaseIterable, Codable{
	case notStarted = "Not Started"
	case inProgress = "In Progress"
	case complete = "Complete"
}
