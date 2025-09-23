import SwiftUI

struct TicketRow: View {
	var ticket: Ticket
	var body: some View {
		HStack{
			VStack(alignment: .leading){
				Text(ticket.ticketName)
					.font(.headline)
				
				if let dueDate = ticket.dueDate{
					Text(dueDate, style: .date)
						.font(.footnote)
						.foregroundStyle(.secondary)
				}
			}
			
			Spacer()
			
			// ToDo: Add Button action
			Button(action: {}){
				Image(systemName: "ellipsis")
			}
		}
	}
}

#Preview {
	TicketRow(ticket: SampleData.ticket1)
		.padding()
}
