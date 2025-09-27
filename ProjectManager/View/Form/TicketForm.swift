//
//  TicketForm.swift
//  ProjectManager
//
//  Created by mikiolight on 2025/09/13.
//

import SwiftUI
import SwiftData

struct TicketForm: View {
	@Environment(\.modelContext) private var modelContext
	@Environment(\.dismiss) private var dismiss

	@Query private var projects: [Project]
	
	@State private var isModalShown: Bool = false
	@State private var selectedItem: Project? = nil
	@State private var ticketName: String = ""
	@State private var ticketDetail: String = ""
	@State private var startDate: Date?
	@State private var dueDate: Date?
	@State private var status: TicketStatus = .notStarted

	var body: some View {
		VStack{
			VStack(alignment: .leading)
			{
				Text("Project")
				ProjectPickerField(selected: $selectedItem)
				{
					isModalShown = true
				}
			}
			.padding()
			.sheet(isPresented: $isModalShown)
			{
				ModalWindow(
					isPresented: $isModalShown,
					selectedItem: $selectedItem
				)
			}

			VStack(alignment: .leading)
			{
				Text("Ticket*")
				TextField("Ticket Name", text: $ticketName)
			}
			.padding()

			Spacer()
			
		}.padding()
	}

	private func saveTicket(){
		guard let project = selectedItem else {return}
		let newTicket = Ticket(
			project: project,
			ticketName: ticketName,
			ticketDetail: ticketDetail,
			startDate: startDate,
			dueDate: dueDate,
			completeDate: nil,
			status: status
		)
		modelContext.insert(newTicket)
		dismiss()
	}
}

#Preview {
	TicketForm()
		.modelContainer(for: [Project.self, Ticket.self])
}
