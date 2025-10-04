import SwiftUI
import SwiftData

struct TicketList: View {
	var tickets: [Ticket]

	@Environment(\.modelContext) private var modelContext

	var body: some View {
		if tickets.isEmpty{
			ContentUnavailableView(
				"No tickets for this tab",
				systemImage: "ticket",
				description: Text("There is no ticket with this status.")
			)
		}else{
			List{
				ForEach(tickets) { ticket in
					NavigationLink(destination: TicketDetail(ticket: ticket))
					{
						TicketRow(ticket: ticket)
					}
				}
				.onDelete(perform: deleteTickets)
			}
		}
	}

	private func deleteTickets(at offsets: IndexSet) {
		withAnimation {
			for index in offsets.sorted(by: >) {
				let ticket = tickets[index]
				modelContext.delete(ticket)
			}
		}
	}
}

#Preview {
	TicketList(tickets: SampleData.project1.tickets)
}
