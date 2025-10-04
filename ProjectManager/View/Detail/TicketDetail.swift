import SwiftUI

struct TicketDetail: View {
	@Bindable var ticket: Ticket
	@State var isShowNoteModal: Bool = false
	var body: some View {
		NavigationStack{
			VStack(alignment: .leading){

				switch(ticket.status){
				case .notStarted:
					Button(action: {
						ticket.status = .inProgress
					}){
						ForwardButtonIcon()
					}
				case .inProgress:
					HStack{
						Button(action: {
							ticket.status = .notStarted
						}){
							BackButtonIcon()
						}
						Button(action:{
							ticket.status = .complete
						}){
							CompleteButtonIcon()
						}
					}
				case .complete:
					Button(action: {
						ticket.status = .inProgress
					}){
						ForwardButtonIcon()
					}
				}

				// Todo: Add relation to Data
				DetailRow(rowHead: "Task", rowContent: ticket.ticketName)
				DetailRow(rowHead: "Project", rowContent: ticket.project.projectName)
				DetailRow(rowHead: "Started", rowContent: ticket.startDate.shortDate())
				DetailRow(rowHead: "Due", rowContent: ticket.dueDate.shortDate())

				Text("Note")
					.font(.footnote)
					.padding()
				List{
					ForEach(ticket.notes){ childNote in
						NoteDetail(ticketName: ticket.ticketName, note: childNote)
					}
					Button(action:{
						isShowNoteModal = true
					}){
						HStack {
							Image(systemName: "pencil")
							Text("New")
						}
						.padding()
					}
				}
				.padding()
				.listStyle(.plain)
				.sheet(isPresented: $isShowNoteModal){
					NoteForm(
						isPresented: $isShowNoteModal,
						parentTicket: ticket,
					)
				}

				Spacer()

			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.navigationTitle("Ticket Detail")
			.navigationBarTitleDisplayMode(.inline)
			.padding()
		}
	}
}


#Preview {
	do{
		SampleData.setupRelations()
	}
	return TicketDetail(ticket: SampleData.ticket1)
}
