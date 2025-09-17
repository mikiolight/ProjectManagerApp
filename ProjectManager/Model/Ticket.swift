//
//  Task.swift
//  ProjectManager
//
//  Created by Mikihisa Saito on 2025/09/14.
//

import Foundation
import SwiftData

@Model
public final class Ticket: Identifiable, Hashable{
	@Attribute(.unique) public var id: UUID
	var project: Project
	var ticketName: String
	var ticketDetail: String?
	var StartDate: Date?
	var dueDate: Date?
	var completeDate: Date?
	var Status: String
	@Relationship(inverse: \Note.ticket)
	var notes: [Note] = []

	init(id: UUID = UUID(), project: Project, ticketName: String, ticketDetail: String? = "", StartDate: Date? = nil, dueDate: Date? = nil, completeDate: Date? = nil, Status: String) {
		self.id = id
		self.project = project
		self.ticketName = ticketName
		self.ticketDetail = ticketDetail
		self.StartDate = StartDate
		self.dueDate = dueDate
		self.completeDate = completeDate
		self.Status = Status
	}
}
