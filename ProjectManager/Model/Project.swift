import Foundation
import SwiftData

@Model
public final class Project: Identifiable, Hashable, Equatable{

	@Attribute(.unique) public var id: UUID
	var projectName: String
	var projectDetails: String?
	@Relationship(deleteRule: .cascade, inverse: \Ticket.project)
	var tickets: [Ticket] = []

	init(
		id: UUID = UUID(),
		tickets: [Ticket],
		projectName: String,
		projectDetails: String? = nil
	) {
		self.id = id
		self.tickets = tickets
		self.projectName = projectName
		self.projectDetails = projectDetails
	}

	// 左右が等しいことをidで判断する
	public static func == (lhs: Project, rhs: Project) -> Bool {
		lhs.id == rhs.id
	}
}
