import SwiftUI

struct TicketList: View {
	var tickets: [Ticket]

	var body: some View {
		if tickets.isEmpty{
			ContentUnavailableView(
				"No tickets for this tab",
				systemImage: "ticket",
				description: Text("There is no ticket with this status.")
			)
		}else{
			List(tickets){ ticket in
				TicketRow(ticket: ticket)
			}
		}
	}
}

#Preview {
	TicketList(tickets: SampleData.getProjectWithTickets().tickets)
}
