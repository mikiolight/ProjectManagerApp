//
//  Project.swift
//  ProjectManager
//
//  Created by Mikihisa Saito on 2025/09/14.
//

import Foundation
import SwiftData

@Model
public final class Project: Identifiable, Hashable{
	@Attribute(.unique) public var id: UUID
	@Relationship(inverse: \Ticket.project)
	var tickets: [Ticket] = []
	var projectName: String
	var projectDetails: String?

	init(id: UUID = UUID(), tickets: [Ticket], projectName: String, projectDetails: String? = nil) {
		self.id = id
		self.tickets = tickets
		self.projectName = projectName
		self.projectDetails = projectDetails
	}
}
