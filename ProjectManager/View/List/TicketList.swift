import SwiftUI

struct TicketList: View {
	var tickets: [Ticket]

	var body: some View {
		List(tickets){ ticket in
			TicketRow(ticket: ticket)
		}
	}
}

#Preview {
	TicketList(tickets: SampleData.getProjectWithTickets().tickets)
}
